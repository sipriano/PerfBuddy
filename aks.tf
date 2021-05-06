resource "azurerm_kubernetes_cluster" "k8s" {
  
    name = var.aks_name
    resource_group_name = var.resource_group_name
    dns_prefix = var.aks_name
    kubernetes_version = var.kubernetes_version
    location = var.location

    tags = {

        "estag" = "HML"
        "grupo" = "Performance"
    }

    identity {
      type = "SystemAssigned"
  }

    linux_profile {
      
        admin_username = var.linux_user

        ssh_key {
          
            key_data = file(var.ssh_public_key)

        }

    }

    default_node_pool {
      
        name = "value"
        enable_auto_scaling = false
        vm_size = var.vm_size
        node_count = var.node_count
        min_count = null
        max_count = null
        os_disk_size_gb = var.os_disk_size_gb
        type = var.node_type
        vnet_subnet_id = azurerm_subnet.subnet-aks.id

    }

    role_based_access_control {
      enabled = true
    }

    addon_profile {
      
        kube_dashboard {
          enabled = true
        }

        oms_agent {
          
            enabled = false

        }

    }

    network_profile {
      load_balancer_sku = "standard"
      network_plugin = "kubenet"
    }

    depends_on = [
      azurerm_virtual_network.perfbuddy-vnet,
      azurerm_subnet.subnet-aks,

    ]

    lifecycle {
      prevent_destroy = "false"
      ignore_changes = [
        tags,
      ]
    }

}