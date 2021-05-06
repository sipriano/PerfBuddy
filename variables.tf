variable environment {
    type = string
    default = "HML"


}

variable location {
    type = string
    default = "westus"

}

variable "resource_group_name" {
    type = string
    default = "perfbuddy-rg"

}

variable "vnet_name" {
    type = string
    default = "perfbuddy-vnet-us-hml"

}

variable "vnet_address" {
    type = list(string)
    default = ["172.26.126.0/23"]

}

variable "subnet_aks_name" {
    type = string
    default = "subnet-aks-us-perfbuddy"

}

variable "subnet_aks_prefix" {
    type = list(string)   
    default = ["172.26.126.0/27"]

}

variable "container_registry_name" {
    type = string
    default = "perfbuddyacr"
  
}

variable "aks_name" {
    type = string
    default = "aks-perfbuddy-hml"

}

variable "kubernetes_version" {
    type = string
    default = "1.18.14"

}

variable "linux_user" {
    type = string
    default = "perfbuddy"

}

variable "ssh_public_key" {
    type = string
    default = "./ssh/hml/id_rsa.pub"

}

variable "vm_size" {
    type = string
    default = "Standard_DS3_v2"

}

variable "node_count" {
    type = string
    default = "1"

}

variable "node_min_count" {
    type = string
    default = "1"

}

variable "node_max_count" {
    type = string
    default = "5"
  
}

variable "os_disk_size_gb" {
    type = string
    default = "50"

}

variable "node_type" {
    type = string
    default = "VirtualMachineScaleSets"

}