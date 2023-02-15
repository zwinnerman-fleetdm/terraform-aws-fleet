variable "iam_role_arn" {
  type        = string
  description = "IAM Role ARN to use for osquery carving"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the s3 bucket to log to"
}

variable "s3_bucket_prefix" {
  type        = string
  description = "The prefix for objects uploaded to s3"
}

