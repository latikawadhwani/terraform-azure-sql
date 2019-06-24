provider "azurerm" {
  version         = "1.27"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "${var.location}"
}

resource "azurerm_template_deployment" "main" {
      name                = "Manged-SQL-ARM"
      resource_group_name = "${azurerm_resource_group.rg.name}"
      template_body = "${file("../../arm/azuredeploy.json")}"

      parameters = {
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
        subnetId = "${azurerm_subnet.defaultsubnet.*.id}"
      }

      deployment_mode = "Incremental"
}