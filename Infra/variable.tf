variable "resource_group_name"{
    type = string
    default = "rg-aks-demo"
}
variable "location" {
    type = string
    default = "koreasouth"
}
variable "vnet_name"{
    type = string
    default = "vnet-aks-demo"
}
variable "vnet_address_space"{
    type = list(string)
    default = ["10.0.0.0/16"]
}
variable "aks_subnet_name"{
    type = string
    default = "snet-aks"
}
variable "aks_subnet_prefix"{
    type = list(string)
    default = ["10.0.1.0/24"]
}
variable "aks_name"{
    type = string
    default = "aks-demo89"
}
variable "node_count"{
    type = number
    default = 2
}
variable "vm_size"{
    type = string
    default = "standard_D2s_v5"
}