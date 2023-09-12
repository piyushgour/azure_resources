variable "api_management_name" {
    type = string
    default = ""
  
}

variable "location" {
  type = string
  default = "West Europ"

}

variable "api_publisher_email" {
    type = string
    default = "test@test.com"
  
}

variable "apim_rg" {
    type = string
    default = "test-rg"
  
}

variable "api_publisher_name" {
    type = string
    default = "test-publisher"
  
}

variable "api_vnet_type" {
    type = string
    default = "default"
  
}

variable "sku_name" {
    type = string
    default = "Developer_1"
}

variable "apim_subnet_id" {
    type = list(string)
    default = []
  
}

variable "insight_name" {
    type = string
    default = "test-insight"
  
}

variable "logger_name" {
    type = string
    default = "test-logger"
  
}