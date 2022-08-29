variable "aws_region" {
  type        = string
  description = "aws region"
  default     = "eu-central-1"
}

variable "log_level" {
  type        = string
  description = "lambda extension log level"
  default     = "trace"
}

