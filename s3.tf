resource "aws_s3_bucket" "example" {
  bucket = "test-bucket-20250819-dp"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
