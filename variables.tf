variable domain_name {
  type        = string
  default     = "getevolvecyber.com"
  description = "Name of DNS Zone"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "MaryanaKnysh"
  }
}
  