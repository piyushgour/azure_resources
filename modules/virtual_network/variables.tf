variable "vpc_name" {
    default =  "Test-Network"
    type = list(string)
  
}

variable "subnet_name" {
    type = string
    default = "test-subnet"
      
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "resource_group_name" {
    type = string
    default = "default"
  
}