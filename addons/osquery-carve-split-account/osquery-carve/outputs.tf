output "extra_environment_variables" {
  value = {
    FLEET_S3_STS_ASSUME_ROLE_ARN = var.iam_role_arn
    FLEET_S3_PREFIX              = var.s3_bucket_prefix
    FLEET_S3_BUCKET              = var.s3_bucket_name
  }
}

output "extra_iam_policies" {
  value = [
    aws_iam_policy.main.arn
  ]
}
