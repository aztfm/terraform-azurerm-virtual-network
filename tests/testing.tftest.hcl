provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

variables {
  address_space = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
  dns_servers   = ["8.8.8.8", "8.8.4.4"]
  bgp_community = "12076:20001"
  subnets = [{
    name                                          = "subnet1",
    address_prefixes                              = ["10.1.0.0/24"],
    delegation                                    = "Microsoft.ApiManagement/service",
    private_link_service_network_policies_enabled = true
    }, {
    name                                      = "subnet2"
    address_prefixes                          = ["10.2.0.0/24"]
    service_endpoints                         = ["Microsoft.Sql"]
    private_endpoint_network_policies_enabled = true
    }, {
    name                                          = "subnet3"
    address_prefixes                              = ["10.3.0.0/24"]
    service_endpoints                             = ["Microsoft.Storage", "Microsoft.Web"]
    delegation                                    = "Microsoft.Web/serverFarms"
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
  }]
}

run "plan" {
  command = plan

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }

  assert {
    condition     = azurerm_virtual_network.vnet.name == run.setup.workspace_id
    error_message = "The virtual network name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.resource_group_name == run.setup.resource_group_name
    error_message = "The virtual network resource group input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.location == run.setup.resource_group_location
    error_message = "The virtual network location input variable is being modified."
  }

  assert {
    condition     = tolist(azurerm_virtual_network.vnet.address_space) == var.address_space
    error_message = "Virtual network address prefix are being modified."
  }

  assert {
    condition     = tolist(azurerm_virtual_network.vnet.dns_servers) == var.dns_servers
    error_message = "Virtual network DNS severs are being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.bgp_community == var.bgp_community
    error_message = "The virtual network bgp community variable is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet1"].name == ({ for s in var.subnets : s.name => s })["subnet1"].name
    error_message = "The subnet1 name is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet1"].address_prefixes == ({ for s in var.subnets : s.name => s })["subnet1"].address_prefixes
    error_message = "Subnet1 address prefixes are being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet1"].delegation[0].name == ({ for s in var.subnets : s.name => s })["subnet1"].delegation
    error_message = "The subnet1 delegation is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet1"].private_link_service_network_policies_enabled == ({ for s in var.subnets : s.name => s })["subnet1"].private_link_service_network_policies_enabled
    error_message = "Subnet1 private link service network policies is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet2"].name == ({ for s in var.subnets : s.name => s })["subnet2"].name
    error_message = "The subnet2 name is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet2"].address_prefixes == ({ for s in var.subnets : s.name => s })["subnet2"].address_prefixes
    error_message = "Subnet2 address prefixes are being modified."
  }

  assert {
    condition     = tolist(azurerm_subnet.subnets["subnet2"].service_endpoints) == ({ for s in var.subnets : s.name => s })["subnet2"].service_endpoints
    error_message = "Subnet2 service endpoints are being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet2"].private_endpoint_network_policies_enabled == ({ for s in var.subnets : s.name => s })["subnet2"].private_endpoint_network_policies_enabled
    error_message = "Subnet2 private endpoint service network policies is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet3"].name == ({ for s in var.subnets : s.name => s })["subnet3"].name
    error_message = "The subnet3 name is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet3"].address_prefixes == ({ for s in var.subnets : s.name => s })["subnet3"].address_prefixes
    error_message = "Subnet3 address prefixes are being modified."
  }

  assert {
    condition     = tolist(azurerm_subnet.subnets["subnet3"].service_endpoints) == ({ for s in var.subnets : s.name => s })["subnet3"].service_endpoints
    error_message = "Subnet3 service endpoints are being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet3"].delegation[0].name == ({ for s in var.subnets : s.name => s })["subnet3"].delegation
    error_message = "The subnet1 delegation is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet3"].private_endpoint_network_policies_enabled == ({ for s in var.subnets : s.name => s })["subnet3"].private_endpoint_network_policies_enabled
    error_message = "Subnet3 private endpoint service network policies is being modified."
  }

  assert {
    condition     = azurerm_subnet.subnets["subnet3"].private_link_service_network_policies_enabled == ({ for s in var.subnets : s.name => s })["subnet3"].private_link_service_network_policies_enabled
    error_message = "Subnet3 private link service network policies is being modified."
  }
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }
}
