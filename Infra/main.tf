
# 1. Resource Group Module
module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

# 2. Network Module
module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  aks_subnet_name     = var.aks_subnet_name
  aks_subnet_prefix   = var.aks_subnet_prefix
}

# 3. AKS Module
module "aks" {
  source = "./modules/aks"

  aks_name            = var.aks_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  node_count          = var.node_count
  vm_size             = var.vm_size

  aks_subnet_id       = module.network.aks_subnet_id

  user_vm_size    = var.user_vm_size
  user_node_count = var.user_node_count
}

