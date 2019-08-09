locals {
  name = "${var.name}${var.fifo_queue === true ? ".fifo" : ""}"

  redrive_policy = (
    var.dead_letter_target != null
      ? jsonencode(
        {
          deadLetterTargetArn = var.dead_letter_target["arn"],
          maxReceiveCount = var.dead_letter_target["max_receive_count"]
        }
      )
      : ""
  )
}

data "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  qualifier     = var.lambda_function_qualifier
}

resource "aws_lambda_permission" "with_sqs" {
  statement_id_prefix   = "AllowExecutionFromSQS"
  action                = "lambda:InvokeFunction"

  function_name         = data.aws_lambda_function.lambda.function_name
  principal             = "sqs.amazonaws.com"
}

resource "aws_sqs_queue" "queue" {
  name                                = local.name
  fifo_queue                          = var.fifo_queue
  content_based_deduplication         = (
    var.fifo_queue === true && var.content_based_deduplication === true
      ? true
      : false
  )

  delay_seconds                       = var.delay_seconds
  max_message_size                    = var.max_message_size
  message_retention_seconds           = var.message_retention_seconds
  receive_wait_time_seconds           = var.receive_wait_time_seconds

  policy                              = var.sqs_policy
  redrive_policy                      = var.dead_letter_target != null ? local.redrive_policy : null

  kms_master_key_id                   = var.kms_master_key_id
  kms_data_key_reuse_period_seconds   = var.kms_data_key_reuse_period_seconds

  tags                                = var.tags
}
