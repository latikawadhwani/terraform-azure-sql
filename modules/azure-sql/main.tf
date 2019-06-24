provider "azurerm" {
  version         = "1.27"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "${var.location}"
}

// # Create virtual network
// resource "azurerm_virtual_network" "vnet" {
//   name                = "myVirtualNetwork"
//   location            = "${azurerm_resource_group.rg.location}"
//   address_space       = "${var.address_space}"
//   resource_group_name = "${azurerm_resource_group.rg.name}"
// }

// #Create subnet
// resource "azurerm_subnet" "defaultsubnet" {
//   name                 = "${var.default_subnet_name}"
//   virtual_network_name = "${azurerm_virtual_network.vnet.name}"
//   resource_group_name  = "${azurerm_resource_group.rg.name}"
//   address_prefix       = "${var.default_subnet_prefix}"
// }

resource "azurerm_template_deployment" "main" {
      name                = "Manged-SQL-ARM"
      resource_group_name = "${azurerm_resource_group.rg.name}"
      template_body = "${file("../arm/azuredeploy.json")}"

      parameters {
        adminUser = "${var.administrator_login}"
        adminPassword  = "${var.administrator_login_password}"
        location = "${azurerm_resource_group.rg.location}"
        storageSizeInGB = "${var.storageSizeInGB}"
        vCores = "${var.vCores}"
        collation = "${var.collation}"
        skuName = "${var.skuName}"
        skuEdition = "${var.skuEdition}"
        licenseType = "${var.licenseType}"
        hardwareFamily = "${var.hardwareFamily}"
      }

      deployment_mode = "Incremental"
}