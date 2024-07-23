data "aws_iam_policy_document" "muse" {
  statement {
    sid = "1appiahpolicy"
  
    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:GetJobToggling",
    ]

    resources = [
      "arn:aws:s3:::arn:aws:s3:::mygarage-bucket/*",
    ]
  }

}