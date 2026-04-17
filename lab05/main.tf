resource "aws_s3_bucket" "my_lab_bucket" {
  bucket = "lab05-project-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}