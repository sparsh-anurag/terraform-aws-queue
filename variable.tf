variable "engine_type" {
  type        = string
  description = "Type of broker engine, `ActiveMQ` or `RabbitMQ`"
  default     = "ActiveMQ"
}

variable "storage_type" {
  type        = string
  description = "Type of storage"
  default = "ebs"
}

variable "publicly_accessible" {
  type        = bool
  description = "Whether to enable connections from applications outside of the VPC that hosts the broker's subnets"
  default     = false
}

variable "console_access" {
  type        = bool
  description = "Whether to enable console access"
  default = true
}

variable "engine_version" {
  type        = string
  description = "The version of the broker engine. See https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html for more details"
  default     = "5.15.14"
}

variable "host_instance_type" {
  type        = string
  description = "The broker's instance type. e.g. mq.t2.micro or mq.m4.large"
  default     = "mq.t3.micro"
}

variable "deployment_mode" {
  type        = string
  description = "The deployment mode of the broker. Supported: SINGLE_INSTANCE and ACTIVE_STANDBY_MULTI_AZ"
  default     = "SINGLE_INSTANCE"
}

variable "subnet_ids" {
  description = "The VPC Subnet IDs to launch in"
  type        = string
}

variable "ActiveMQ_username" {
  type        = list(string)
  description = "Admin username"
  default     = []
}

variable "ActiveMQ_password" {
  type        = list(string)
  description = "Admin password"
  default     = []
  sensitive   = true
}

variable "project_name_prefix" {
  description = "A string value to describe prefix of all the resources"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "security_groups" {
  description = "A string value for Security Group ID"
  type        = list(string)
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = true
}

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection."
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
}

variable "delete_on_termination" {
  description = "Whether EBS volume will be deleted when instance gets deleted."
  type        = bool
  default     = true
}

variable "volume_encrypted" {
  description = "Whether EBS volume will be encrypted."
  type        = bool
  default     = true
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "root_volume_size" {
  type = number
}

variable "vpc_id" {
  description = "A string value for VPC ID"
  type        = string
}

variable "create_aws_ActiveMQ" {
  type    = bool
  default = false
}

variable "create_aws_ec2_RabbitMQ" {
  type    = bool
  default = true
}


variable "environment" {
  type    = string
  default = "dev"
}

variable "kms_key_id" {
  type    = string
}

variable "project" {
  type    = string
  default = "test"
}