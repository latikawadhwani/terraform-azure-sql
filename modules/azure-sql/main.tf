provider "azurerm" {
  version         = "1.27"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "${var.location}"
}

resource "azurerm_sql_server" "main" {
  name                         = "mysqlserver"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${azurerm_resource_group.rg.location}"
  version                      = "${var.sql_server_version}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}" 
}

resource "azurerm_sql_database" "main" {
  name                             = "mysqldatabase"
  resource_group_name              = "${azurerm_resource_group.rg.name}"
  location                         = "${azurerm_resource_group.rg.location}"
  server_name                      = "${azurerm_sql_server.main.name}"
  edition                          = "${var.edition}"
  requested_service_objective_name = "${var.requested_service_objective_name}"
  create_mode                      = "${var.create_mode}"
}

resource "azurerm_sql_firewall_rule" "main" {
  name                = "AlllowAzureServices"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.main.name}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}