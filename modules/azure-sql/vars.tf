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

variable "sql_server_version" {
  default = "12.0"
}

variable "create_mode" {
  default = "Default"
}

variable "collation" {
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "requested_service_objective_name" {
  default = "S0"
}

variable "edition" {
  default = "Basic"
}

variable "start_ip_address" {
  default = "0.0.0.0"
}

variable "end_ip_address" {
  default = "0.0.0.0"
}

