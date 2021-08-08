provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_role" "role" {
  name = "iam_for_lambda_dice_summ"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# Created Policy for IAM Role (s3 and log access)
resource "aws_iam_policy" "policy" {
  name = "my-s3cw-policy-dicesumm"
  description = "Access S3 and Cloudwatch logs policy"


  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogGroup",
                "logs:CreateLogStream"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:DescribeJob",
                "s3:List*",
                "s3:Get*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

# Attached IAM Role and the new created Policy
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

# generate archive file

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "dice_summary.py"
  output_path = "dice_summary.zip"
}

resource "aws_lambda_function" "dicesumm_lambda" {
  filename      = "dice_summary.zip"
  description   = "Dice Rolling Summary of events"
  function_name = "dice_summary"
  role          = "${aws_iam_role.role.arn}"
  handler       = "dice_summary.lambda_handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"

  runtime = "python3.8"

}
