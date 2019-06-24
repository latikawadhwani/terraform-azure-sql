variable "subscription_id" {
  default = ""
}

variable "tenant_id" {
    default = ""
}

variable "administrator_login" {
  default = ""
}

variable "administrator_login_password" {
  default = ""
}

variable "location" {
  default = "West US"
}

variable "collation" {
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "storageSizeInGB" {
  default = "256"
}

variable "vCores" {
  default = "8"
}

variable "licenseType" {
  default = "LicenseIncluded"
}

variable "hardwareFamily" {
  default = "Gen4"
}

variable "address_space" {
  type = "string"
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

variable "dns_servers" {
  type = "list"
  description = "The DNS servers to be used by the virtual network"
  default     = []
}

variable "default_subnet_prefix" {
  type = "string"
  description = "The address prefix to use for the default subnet."
  default     = "10.0.0.0/24"
}