resource "azurerm_resource_group" "perfbuddy-rg" {
  
    name = var.resource_group_name
    location = var.location

    tags = {
      "estag" = "HML"
      "grupo" = "performance"
    }
}