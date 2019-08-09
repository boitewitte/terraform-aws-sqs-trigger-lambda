resource "aws_lambda_event_source_mapping" "queue" {
  enabled           = var.event_source_mapping_enabled

  event_source_arn  = aws_sqs_queue.queue.arn

  function_name     = var.lambda_arn

  batch_size        = var.batch_size
}
