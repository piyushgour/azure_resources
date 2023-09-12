variable "rg_name" {
  type = string
  default = "my-resource-group"
}

variable "location" {
    type = string
    default = "westeurope"
  
}
variable "reserved" {
    type = bool
    default = true
  
}