variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-3"
}

variable "instance_count" {
  type = map(string)

  default = {
    "rest"            = 0
    "connect"         = 0
    "ksql"            = 0
    "schema"          = 0
    "control_center"  = 1
    "broker"          = 3 // Needs at least 3 brokers (replication.factor minimum set to 3)
    "zookeeper"       = 1
  }
}

variable "instance_prefix" {
  default     = "staging"
}

variable "aws_ami" {
  description = "The AWS AMI."
  default     = "ami-05a51ff00c1d77571" // Amazon Linux 2 AMI 2.0.20191024.3 x86_64 HVM gp2 for Paris region.
}

variable "aws_instance_type" {
  description = "The AWS Instance Type."
  default     = "t2.small"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "Key Pair"
  default     = "kafka-test"
}