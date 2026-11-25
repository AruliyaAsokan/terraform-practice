resource "aws_iam_user" "readers" {
  for_each = toset(var.user_names)

  name = each.value
  path = "/practice/"

  tags = {
    Project     = "iam-automation-practice"
    ManagedBy   = "terraform"
    Environment = "production"
  }
}
resource "aws_iam_policy" "s3_read" {
  name        = var.policy_name
  description = "Read-only access to S3, defined in a Terraform variable"
  policy      = var.s3_read_policy
}

resource "aws_iam_user_policy_attachment" "s3_read" {
  for_each = aws_iam_user.readers

  user       = each.value.name
  policy_arn = aws_iam_policy.s3_read.arn
}
