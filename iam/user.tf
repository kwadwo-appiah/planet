resource "aws_iam_user" "test" {
  name = var.aws_iam_user
}

resource "aws_iam_policy" "policy" {
  name   = var.aws_iam_policy
  path   = "/"
  policy = data.aws_iam_policy_document.muse.json
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.test.name
  policy_arn = var.policy_arn
}
