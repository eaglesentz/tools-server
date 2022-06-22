resource "aws_s3_bucket" "proj_s3_tfstate" {
  bucket        = "${var.bucket_name}-tfstate"
  force_destroy = true
  tags = merge(var.common_tags, {
    Name = "${var.bucket_name}-bucket"
    }
  )
}