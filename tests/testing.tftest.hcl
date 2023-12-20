provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

run "testing_plan" {
  command = plan

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
    address_space       = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]
    subnets = [{
      name                                          = "subnet1",
      address_prefixes                              = ["10.1.0.0/24"],
      delegation                                    = "Microsoft.ApiManagement/service",
      enforce_private_link_service_network_policies = true
      }, {
      name                                           = "subnet2"
      address_prefixes                               = ["10.2.0.0/24"]
      service_endpoints                              = ["Microsoft.Sql"]
      enforce_private_link_endpoint_network_policies = true
      }, {
      name                                           = "subnet3"
      address_prefixes                               = ["10.3.0.0/24"]
      service_endpoints                              = ["Microsoft.Storage", "Microsoft.Web"]
      delegation                                     = "Microsoft.Web/serverFarms"
      enforce_private_link_service_network_policies  = false
      enforce_private_link_endpoint_network_policies = false
    }]
  }

  assert {
    condition     = azurerm_virtual_network.vnet.name == run.setup.resource_group_name
    error_message = "The virtual network name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.location == run.setup.resource_group_location
    error_message = "The virtual network name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.ddos_protection_plan[0].enable == true
    error_message = "The configuration of the ddos protection plan is set to false."
  }
}

run "testing_apply" {
  command = apply

  variables {
    name                    = run.setup.workspace_id
    resource_group_name     = run.setup.resource_group_name
    location                = run.setup.resource_group_location
    address_space           = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
    dns_servers             = ["8.8.8.8", "8.8.4.4"]
    subnets = [{
      name                                          = "subnet1",
      address_prefixes                              = ["10.1.0.0/24"],
      delegation                                    = "Microsoft.ApiManagement/service",
      enforce_private_link_service_network_policies = true
      }, {
      name                                           = "subnet2"
      address_prefixes                               = ["10.2.0.0/24"]
      service_endpoints                              = ["Microsoft.Sql"]
      enforce_private_link_endpoint_network_policies = true
      }, {
      name                                           = "subnet3"
      address_prefixes                               = ["10.3.0.0/24"]
      service_endpoints                              = ["Microsoft.Storage", "Microsoft.Web"]
      delegation                                     = "Microsoft.Web/serverFarms"
      enforce_private_link_service_network_policies  = false
      enforce_private_link_endpoint_network_policies = false
    }]
  }

  assert {
    condition     = azurerm_virtual_network.vnet.name == run.setup.resource_group_name
    error_message = "The virtual network name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.location == run.setup.resource_group_location
    error_message = "The virtual network name input variable is being modified."
  }

  assert {
    condition     = azurerm_virtual_network.vnet.ddos_protection_plan[0].enable == true
    error_message = "The configuration of the ddos protection plan is set to false."
  }
}
