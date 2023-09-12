variable "api_management_name" {
    type = string
    default = ""
  
}

variable "location" {
  type = string
  default = "westeurope"

}

variable "api_publisher_email" {
    type = string
    default = "test@test.com"
    validation {
        condition     = length(var.api_publisher_email) > 0
        error_message = "The publisher_email must contain at least one character."
    }
  
}

variable "apim_rg" {
    type = string
    default = "test-rg"
  
}

variable "api_publisher_name" {
    type = string
    default = "test-publisher"
  
}


variable "sku_name" {
    type = string
    default = "Developer_1"
}



variable "insight_name" {
    type = string
    default = "test-insight"
  
}

variable "logger_name" {
    type = string
    default = "test-logger"
  
}

variable "tags" {
  type        = map(string)
  default = null
  
}