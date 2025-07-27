resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "cicd-artifact-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "CI/CD Artifact Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifact_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
