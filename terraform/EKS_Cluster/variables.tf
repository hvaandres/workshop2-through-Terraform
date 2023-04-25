variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "aws_secret_key" {
  type    = string
  default = "value"
}

variable "aws_access_key" {
  type    = string
  default = "value"
}