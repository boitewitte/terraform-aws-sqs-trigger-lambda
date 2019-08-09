variable "attach_execution_policy_to_role" {
  type        = string
  description = "The name of the Lambda Execution Role to which the AWSLambdaSQSQueueExecutionRole policy should be attached. By default there is no attachment"
  default     = null
}

variable "batch_size" {
  type        = number
  description = "The largest number of records that Lambda will retrieve from your SQS queue at the time of invocation."
  default     = 10
}

variable "dead_letter_target" {
  type        = object({ arn = string, max_receive_count = number})
  description = "The Policy to set up the Dead Letter Queue. max_receive_count should be > 5"
  default     = null
}

variable "delay_seconds" {
  type        = number
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)."
  default     = 0
}

variable "event_source_mapping_enabled" {
  type        = bool
  description = " Determines if the event source mapping will be enabled on creation. "
}

variable "fifo_queue" {
  type        = bool
  description = "Boolean designating a FIFO queue."
  default     = false
}

variable "kms_master_key_id" {
  type        = string
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). "
  default     = null
}

variable "lambda_function_name" {
  type        = string
  description = "The ARN for the Lambda function that gets invoked by SQS"
}

variable "lambda_function_qualifier" {
  type        = string
  description = "Alias name or version number of the lambda function"
  default     = null
}


variable "max_message_size" {
  type        = number
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)."
  default     = 262144
}

variable "name" {
  type        = string
  description = "The name for the SQS queue"
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)."
  default     = 0
}

variable "sqs_policy" {
  type        = string
  description = "The JSON policy for the SQS queue."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the queue."
  default     = {}
}
