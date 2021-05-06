resource "azurerm_virtual_network" "perfbuddy-vnet" {
  
    name = var.vnet_name
    resource_group_name = var.resource_group_name
    location = var.location
    address_space = var.vnet_address
    dns_servers = []


        depends_on = [
          azurerm_resource_group.perfbuddy-rg
        ]

    tags = {
      "estag" = "HML"
      "grupo" = "Performance"

    }

    lifecycle {
      prevent_destroy = false
      ignore_changes = [
          tags,
      ]
    }


}

resource "azurerm_subnet" "subnet-aks" {

    name = var.subnet_aks_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.vnet_name
    address_prefixes = var.subnet_aks_prefix
  
    depends_on = [
      azurerm_resource_group.perfbuddy-rg,
      azurerm_virtual_network.perfbuddy-vnet,

    ]

}