variable "app_service_plan" {
    default = ""
    type = string
  
}

variable "location" {
    type = string
    default = "West Europ"
  
}

variable "rg_name" {
    type = string
    default = ""
  
}

variable "kind" {
    type = string
    default = "linux"
}