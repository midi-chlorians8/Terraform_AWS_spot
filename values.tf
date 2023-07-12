variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Enter Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "tags" {
  #   type = map(string)
  default = {
    Environment = "Test"
    Proj        = "Test_Kube_Spray"
    Owner       = "I_am"
    terraform   = "True"
  }
}

variable "key_name" {
  default = "KeyFromLinuxAWS-Frankfurt"
}

variable "node_count" {
  description = "Number of nodes to create"
  type        = number
  default     = 1
}