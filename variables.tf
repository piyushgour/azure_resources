variable "rg_name" {
  type = string
  default = "my-resource-group"
}

variable "location" {
    type = string
    default = "West Europe"
  
}
variable "reserved" {
    type = bool
    default = true
  
}