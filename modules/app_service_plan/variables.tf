variable "app_service_plan" {
    default = "service_plan"
    type = string
  
}

variable "location" {
    type = string
    default = "westeurope"
  
}

variable "rg_name" {
    type = string
    default = "test-rg"
  
}

variable "os_type" {
    type = string
    default = "Linux"
    validation {
        condition     = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
        error_message = "The value for os_type must be either `Windows`, `Linux`, `WindowsContainer`."
    }
}