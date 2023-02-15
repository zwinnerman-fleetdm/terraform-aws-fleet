data "aws_iam_policy_document" "main" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [var.iam_role_arn]
  }
}

resource "aws_iam_policy" "main" {
  policy = data.aws_iam_policy_document.main.json
}
