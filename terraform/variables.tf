variable "aws_region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name for the project, used as a prefix for resources."
  type        = string
  default     = "medusa-project"
}

# Database variables
variable "db_username" {
  description = "The username for the PostgreSQL database."
  type        = string
  default     = "medusapgadmin"
}

variable "db_password" {
  description = "The password for the PostgreSQL database."
  type        = string
  sensitive   = true
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository for the Medusa backend."
  type        = string
  default     = "medusa-backend"
} 