resource "aws_dynamodb_table" "terraform-lock-state" {
  hash_key       = "LockID"
  name           = "workday-terraform-lock-state"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(var.common_tags, {
    Name = "${var.dynamotable}"
  })
}