# tfsec:ignore:aws-s3-block-public-acls
# tfsec:ignore:aws-s3-block-public-policy
# tfsec:ignore:aws-s3-enable-bucket-encryption
# tfsec:ignore:aws-s3-specify-public-access-block
# tfsec:ignore:aws-s3-enable-versioning
# tfsec:ignore:aws-s3-enable-bucket-logging
# tfsec:ignore:aws-s3-encryption-customer-key
# tfsec:ignore:aws-s3-no-public-buckets
# tfsec:ignore:aws-s3-ignore-public-acls
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "sftp-example"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
