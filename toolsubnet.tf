resource "aws_subnet" "tool_subnet" {
  vpc_id                  = aws_vpc.proj-vpc.id
  cidr_block              = var.tool_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = var.subnet_name,
    Type = "VPC Private Subnet"
  })
}

resource "aws_internet_gateway" "workday" {
  vpc_id = aws_vpc.proj-vpc.id
  tags = {
    Name = "Workday-Internet-Gateway"
  }
}

resource "aws_nat_gateway" "workday" {
  subnet_id = aws_subnet.tool_subnet.id
  allocation_id = aws_eip.workday.id

  tags = {
    Name = "Workdau-NAT-GW"
  }
}

resource "aws_route_table" "workday" {
  vpc_id = aws_vpc.proj-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.workday.id
  }
  tags = {
    Name= "workday-RT"
  }
}

resource "aws_route_table_association" "workday" {
  route_table_id = aws_route_table.workday.id
  subnet_id = aws_subnet.tool_subnet.id

}
