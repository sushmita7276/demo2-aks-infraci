resource "azurerm_kubernetes_cluster" "aks" {

  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.aks_name

  sku_tier = "Free"

  default_node_pool {
    name            = "system"
    node_count      = var.node_count
    vm_size         = var.vm_size
    vnet_subnet_id  = var.aks_subnet_id
    max_pods        = 30
    os_disk_size_gb = 30
  }

  # System Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"

    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"

    pod_cidr       = "10.244.0.0/16"
    service_cidr   = "10.2.0.0/16"
    dns_service_ip = "10.2.0.10"
  }
}