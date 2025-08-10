resource "aws_s3_bucket" "s3_resource_type" {
  bucket = "suyash-s3-bucket-01"

  tags = {
    Name        = "suyash-s3-bucket-01"
    Environment = "Dev"
  }
}
