variable "vpc_id" {}

variable "vpc_cidr" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}
variable "db_password" {
  sensitive = true
}