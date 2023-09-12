variable "vpc_name" {
    default =  "Test_Network"
    type = string
  
}

variable "subnet_name" {
    type = string
    default = "test-subnet"
      
}

variable "location" {
  type = string
  default = "westeurope"
}

variable "resource_group_name" {
    type = string
    default = "default"
  
}
