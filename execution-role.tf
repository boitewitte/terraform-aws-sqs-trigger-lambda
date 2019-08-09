data "aws_iam_policy" "lambda_sqs_execution_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
}

resource "aws_iam_role_policy_attachment" "attach_execution_policy_to_role" {
  count       = var.attach_execution_policy_to_role != null ? 1 : 0

  role        = var.attach_execution_policy_to_role
  policy_arn  = data.aws_iam_policy.lambda_sqs_execution_policy.arn
}
