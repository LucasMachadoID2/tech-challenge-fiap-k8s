resource "aws_s3_bucket" "example" {
  bucket = "bucket-backend"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
