resource "aws_iam_role" "role" {
  name = aws_s3_bucket.bucket.bucket
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "",
        Effect : "Allow",
        Principal : {
          Service : "transfer.amazonaws.com"
        },
        Action : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "policy" {
  name   = aws_s3_bucket.bucket.bucket
  role   = aws_iam_role.role.id
  policy = templatefile("policy/rol_policy.tpl", { bucket-arn = aws_s3_bucket.bucket.arn })
}
