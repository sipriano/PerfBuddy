resource "azurerm_container_registry" "acr" {
  
    name = var.container_registry_name
    resource_group_name = var.resource_group_name
    location = var.location
    sku = "standard"
    admin_enabled = false
    tags = {

        estag = "HML"
        grupo = "Performance"

    }

    depends_on = [
      azurerm_resource_group.perfbuddy-rg
    ]

}