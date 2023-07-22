variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region for the provider to deploy resources into."
}
variable "vpc_cidr_block" {
  type        = string
  description = "AWS CIDR"
}

variable "cluster_name" {
  type        = string
}

variable "public_subnet_cidr_block" {
  type        = list(string)
}

variable "private_subnet_cidr_block" {
  type        = list(string)
}
variable "node_type" {
  type = list(string)
  default = ["t3.small"]
}
variable "node_name" {
  type = string
}