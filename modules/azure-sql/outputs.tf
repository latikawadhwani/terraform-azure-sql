// data "azurerm_subnet" "test" {
//     name                 = "${data.azurerm_virtual_network.vnet.subnets[count.index]}"
//     virtual_network_name = "${data.azurerm_virtual_network.vnet.name}"
//     resource_group_name  = "${data.azurerm_virtual_network.vnet.resource_group_name}"
//     count = "${count(data.azurerm_virtual_network.vnet.subnets)}"
// }

// output "subnet_ids" {
//      value = "${data.azurerm_subnet.defaultsubnet.*.id}"
//  }