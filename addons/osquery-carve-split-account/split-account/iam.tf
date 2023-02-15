resource "aws_iam_role" "fleet_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = [var.fleet_iam_role_arn]
      type        = "AWS"
    }
  }
}

data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "s3:GetObject*",
      "s3:PutObject*",
      "s3:ListBucket*",
      "s3:ListMultipartUploadParts*",
      "s3:DeleteObject",
      "s3:CreateMultipartUpload",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
      "s3:GetBucketLocation"
    ]
    resources = [aws_s3_bucket.main.arn, "${aws_s3_bucket.main.arn}/*"]
  }

  statement {
    actions = [
      "kms:Encrypt",
      "kms:GenerateDataKey"
    ]
    resources = [data.aws_kms_key.main.arn]
  }

}

resource "aws_iam_policy" "main" {
  policy = data.aws_iam_policy_document.firehose.json
}

resource "aws_iam_policy_attachment" "main" {
  name       = aws_iam_role.fleet_role.name
  policy_arn = aws_iam_policy.main.arn
}
