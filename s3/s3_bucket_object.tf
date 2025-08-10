resource "aws_s3_object" "object" {
  bucket = "suyash-s3-bucket-01"
  key    = "sample.txt"
  source = "s3.tf"

  etag = filemd5("s3.tf")
}
