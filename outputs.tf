output "sqs_id" {
  value       = aws_sqs_queue.queue.id
  description = "The URL for the created Amazon SQS queue."
}

output "sqs_arn" {
  value       = aws_sqs_queue.queue.arn
  description = "The ARN of the SQS queue"
}
