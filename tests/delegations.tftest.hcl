provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

variables {
  address_space = ["10.0.0.0/8"]
  subnets = [{
    name             = "delegation-00"
    address_prefixes = ["10.0.0.0/24"]
    delegation       = "GitHub.Network/networkSettings"
    }, {
    name             = "delegation-01"
    address_prefixes = ["10.1.0.0/24"]
    delegation       = "Informatica.DataManagement/organizations"
    }, {
    name             = "delegation-02"
    address_prefixes = ["10.2.0.0/24"]
    delegation       = "Microsoft.ApiManagement/service"
    }, {
    name             = "delegation-03"
    address_prefixes = ["10.3.0.0/24"]
    delegation       = "Microsoft.Apollo/npu"
    }, {
    name             = "delegation-04"
    address_prefixes = ["10.4.0.0/24"]
    delegation       = "Microsoft.App/environments"
    # delegation-05: Microsoft.App/testClients — Need Microsoft.Network/AllowInternalDelegations
    # {
    #   name             = "delegation-05"
    #   address_prefixes = ["10.5.0.0/24"]
    #   delegation       = "Microsoft.App/testClients"
    # }, {

    name             = "delegation-06"
    address_prefixes = ["10.6.0.0/24"]
    delegation       = "Microsoft.AVS/PrivateClouds"
    }, {
    name             = "delegation-07"
    address_prefixes = ["10.7.0.0/24"]
    delegation       = "Microsoft.AzureCosmosDB/clusters"
    }, {
    name             = "delegation-08"
    address_prefixes = ["10.8.0.0/24"]
    delegation       = "Microsoft.BareMetal/AzureHostedService"
    }, {
    name             = "delegation-09"
    address_prefixes = ["10.9.0.0/24"]
    delegation       = "Microsoft.BareMetal/AzureVMware"
    }, {
    name             = "delegation-10"
    address_prefixes = ["10.10.0.0/24"]
    delegation       = "Microsoft.BareMetal/CrayServers"
    }, {
    name             = "delegation-11"
    address_prefixes = ["10.11.0.0/24"]
    delegation       = "Microsoft.Batch/batchAccounts"
    }, {
    name             = "delegation-12"
    address_prefixes = ["10.12.0.0/24"]
    delegation       = "Microsoft.CloudTest/hostedpools"
    }, {
    name             = "delegation-13"
    address_prefixes = ["10.13.0.0/24"]
    delegation       = "Microsoft.CloudTest/images"
    }, {
    name             = "delegation-14"
    address_prefixes = ["10.14.0.0/24"]
    delegation       = "Microsoft.CloudTest/pools"
    # delegation-15: Microsoft.Codespaces/plans — InvalidServiceNameOnDelegation
    # {
    #   name             = "delegation-15"
    #   address_prefixes = ["10.15.0.0/24"]
    #   delegation       = "Microsoft.Codespaces/plans"
    # }, {

    name             = "delegation-16"
    address_prefixes = ["10.16.0.0/24"]
    delegation       = "Microsoft.ContainerInstance/containerGroups"
    }, {
    name             = "delegation-17"
    address_prefixes = ["10.17.0.0/24"]
    delegation       = "Microsoft.ContainerService/managedClusters"
    }, {
    name             = "delegation-18"
    address_prefixes = ["10.18.0.0/24"]
    delegation       = "Microsoft.Databricks/workspaces"
    }, {
    name             = "delegation-19"
    address_prefixes = ["10.19.0.0/24"]
    delegation       = "Microsoft.DBforMySQL/flexibleServers"
    }, {
    name             = "delegation-20"
    address_prefixes = ["10.20.0.0/24"]
    delegation       = "Microsoft.DBforMySQL/servers"
    }, {
    name             = "delegation-21"
    address_prefixes = ["10.21.0.0/24"]
    delegation       = "Microsoft.DBforMySQL/serversv2"
    }, {
    name             = "delegation-22"
    address_prefixes = ["10.22.0.0/24"]
    delegation       = "Microsoft.DBforPostgreSQL/flexibleServers"
    }, {
    name             = "delegation-23"
    address_prefixes = ["10.23.0.0/24"]
    delegation       = "Microsoft.DBforPostgreSQL/serversv2"
    }, {
    name             = "delegation-24"
    address_prefixes = ["10.24.0.0/24"]
    delegation       = "Microsoft.DBforPostgreSQL/singleServers"
    }, {
    name             = "delegation-25"
    address_prefixes = ["10.25.0.0/24"]
    delegation       = "Microsoft.DelegatedNetwork/controller"
    }, {
    name             = "delegation-26"
    address_prefixes = ["10.26.0.0/24"]
    delegation       = "Microsoft.DevCenter/networkConnection"
    }, {
    name             = "delegation-27"
    address_prefixes = ["10.27.0.0/24"]
    delegation       = "Microsoft.DevOpsInfrastructure/pools"
    }, {
    name             = "delegation-28"
    address_prefixes = ["10.28.0.0/24"]
    delegation       = "Microsoft.DocumentDB/cassandraClusters"
    }, {
    name             = "delegation-29"
    address_prefixes = ["10.29.0.0/24"]
    delegation       = "Microsoft.Fidalgo/networkSettings"
    }, {
    name             = "delegation-30"
    address_prefixes = ["10.30.0.0/24"]
    delegation       = "Microsoft.HardwareSecurityModules/dedicatedHSMs"
    }, {
    name             = "delegation-31"
    address_prefixes = ["10.31.0.0/24"]
    delegation       = "Microsoft.Kusto/clusters"
    }, {
    name             = "delegation-32"
    address_prefixes = ["10.32.0.0/24"]
    delegation       = "Microsoft.LabServices/labplans"
    }, {
    name             = "delegation-33"
    address_prefixes = ["10.33.0.0/24"]
    delegation       = "Microsoft.Logic/integrationServiceEnvironments"
    }, {
    name             = "delegation-34"
    address_prefixes = ["10.34.0.0/24"]
    delegation       = "Microsoft.MachineLearningServices/workspaces"
    }, {
    name             = "delegation-35"
    address_prefixes = ["10.35.0.0/24"]
    delegation       = "Microsoft.MessagingConnectors/connectors"
    }, {
    name             = "delegation-36"
    address_prefixes = ["10.36.0.0/24"]
    delegation       = "Microsoft.Netapp/volumes"
    }, {
    name             = "delegation-37"
    address_prefixes = ["10.37.0.0/24"]
    delegation       = "Microsoft.Network/applicationGateways"
    }, {
    name             = "delegation-38"
    address_prefixes = ["10.38.0.0/24"]
    delegation       = "Microsoft.Network/dnsResolvers"
    # delegation-40: Microsoft.Orbital/orbitalGateways — InvalidServiceNameOnDelegation
    # {
    #   name             = "delegation-40"
    #   address_prefixes = ["10.40.0.0/24"]
    #   delegation       = "Microsoft.Orbital/orbitalGateways"
    # }, {

    name             = "delegation-41"
    address_prefixes = ["10.41.0.0/24"]
    delegation       = "Microsoft.PowerAutomate/hostedRpa"
    }, {
    name             = "delegation-42"
    address_prefixes = ["10.42.0.0/24"]
    delegation       = "Microsoft.PowerPlatform/enterprisePolicies"
    }, {
    name             = "delegation-43"
    address_prefixes = ["10.43.0.0/24"]
    delegation       = "Microsoft.PowerPlatform/vnetaccesslinks"
    }, {
    name             = "delegation-44"
    address_prefixes = ["10.44.0.0/24"]
    delegation       = "Microsoft.ServiceFabricMesh/networks"
    }, {
    name             = "delegation-45"
    address_prefixes = ["10.45.0.0/24"]
    delegation       = "Microsoft.ServiceNetworking/trafficControllers"
    }, {
    name             = "delegation-46"
    address_prefixes = ["10.46.0.0/24"]
    delegation       = "Microsoft.Singularity/accounts/networks"
    }, {
    name             = "delegation-47"
    address_prefixes = ["10.47.0.0/24"]
    delegation       = "Microsoft.Singularity/accounts/npu"
    }, {
    name             = "delegation-48"
    address_prefixes = ["10.48.0.0/24"]
    delegation       = "Microsoft.Sql/managedInstances"
    }, {
    name             = "delegation-49"
    address_prefixes = ["10.49.0.0/24"]
    delegation       = "Microsoft.StoragePool/diskPools"
    }, {
    name             = "delegation-50"
    address_prefixes = ["10.50.0.0/24"]
    delegation       = "Microsoft.StreamAnalytics/streamingJobs"
    }, {
    name             = "delegation-51"
    address_prefixes = ["10.51.0.0/24"]
    delegation       = "Microsoft.Synapse/workspaces"
    }, {
    name             = "delegation-52"
    address_prefixes = ["10.52.0.0/24"]
    delegation       = "Microsoft.Web/hostingEnvironments"
    }, {
    name             = "delegation-53"
    address_prefixes = ["10.53.0.0/24"]
    delegation       = "Microsoft.Web/serverFarms"
    }, {
    name             = "delegation-54"
    address_prefixes = ["10.54.0.0/24"]
    delegation       = "NGINX.NGINXPLUS/nginxDeployments"
    }, {
    name             = "delegation-55"
    address_prefixes = ["10.55.0.0/24"]
    delegation       = "Oracle.Database/networkAttachments"
    }, {
    name             = "delegation-56"
    address_prefixes = ["10.56.0.0/24"]
    delegation       = "PaloAltoNetworks.Cloudngfw/firewalls"
    }, {
    name             = "delegation-57"
    address_prefixes = ["10.57.0.0/24"]
    delegation       = "PureStorage.Block/storagePools"
    }, {
    name             = "delegation-58"
    address_prefixes = ["10.58.0.0/24"]
    delegation       = "Qumulo.Storage/fileSystems"
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
    condition     = azurerm_subnet.subnets["delegation-00"].delegation[0].service_delegation[0].name == "GitHub.Network/networkSettings"
    error_message = "plan: delegation GitHub.Network/networkSettings (delegation-00) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-00"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation GitHub.Network/networkSettings (delegation-00) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-01"].delegation[0].service_delegation[0].name == "Informatica.DataManagement/organizations"
    error_message = "plan: delegation Informatica.DataManagement/organizations (delegation-01) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-01"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Informatica.DataManagement/organizations (delegation-01) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-02"].delegation[0].service_delegation[0].name == "Microsoft.ApiManagement/service"
    error_message = "plan: delegation Microsoft.ApiManagement/service (delegation-02) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-02"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"])
    error_message = "plan: delegation Microsoft.ApiManagement/service (delegation-02) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-03"].delegation[0].service_delegation[0].name == "Microsoft.Apollo/npu"
    error_message = "plan: delegation Microsoft.Apollo/npu (delegation-03) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-03"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Apollo/npu (delegation-03) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-04"].delegation[0].service_delegation[0].name == "Microsoft.App/environments"
    error_message = "plan: delegation Microsoft.App/environments (delegation-04) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-04"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.App/environments (delegation-04) service_delegation actions are not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-05"].delegation[0].service_delegation[0].name == "Microsoft.App/testClients"
  #   error_message = "plan: delegation Microsoft.App/testClients (delegation-05) service_delegation name is not as expected."
  # }

  # assert {
  #   condition     = sort(azurerm_subnet.subnets["delegation-05"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
  #   error_message = "plan: delegation Microsoft.App/testClients (delegation-05) service_delegation actions are not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-06"].delegation[0].service_delegation[0].name == "Microsoft.AVS/PrivateClouds"
    error_message = "plan: delegation Microsoft.AVS/PrivateClouds (delegation-06) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-06"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*"])
    error_message = "plan: delegation Microsoft.AVS/PrivateClouds (delegation-06) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-07"].delegation[0].service_delegation[0].name == "Microsoft.AzureCosmosDB/clusters"
    error_message = "plan: delegation Microsoft.AzureCosmosDB/clusters (delegation-07) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-07"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.AzureCosmosDB/clusters (delegation-07) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-08"].delegation[0].service_delegation[0].name == "Microsoft.BareMetal/AzureHostedService"
    error_message = "plan: delegation Microsoft.BareMetal/AzureHostedService (delegation-08) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-08"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.BareMetal/AzureHostedService (delegation-08) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-09"].delegation[0].service_delegation[0].name == "Microsoft.BareMetal/AzureVMware"
    error_message = "plan: delegation Microsoft.BareMetal/AzureVMware (delegation-09) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-09"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.BareMetal/AzureVMware (delegation-09) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-10"].delegation[0].service_delegation[0].name == "Microsoft.BareMetal/CrayServers"
    error_message = "plan: delegation Microsoft.BareMetal/CrayServers (delegation-10) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-10"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.BareMetal/CrayServers (delegation-10) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-11"].delegation[0].service_delegation[0].name == "Microsoft.Batch/batchAccounts"
    error_message = "plan: delegation Microsoft.Batch/batchAccounts (delegation-11) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-11"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.Batch/batchAccounts (delegation-11) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-12"].delegation[0].service_delegation[0].name == "Microsoft.CloudTest/hostedpools"
    error_message = "plan: delegation Microsoft.CloudTest/hostedpools (delegation-12) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-12"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.CloudTest/hostedpools (delegation-12) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-13"].delegation[0].service_delegation[0].name == "Microsoft.CloudTest/images"
    error_message = "plan: delegation Microsoft.CloudTest/images (delegation-13) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-13"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.CloudTest/images (delegation-13) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-14"].delegation[0].service_delegation[0].name == "Microsoft.CloudTest/pools"
    error_message = "plan: delegation Microsoft.CloudTest/pools (delegation-14) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-14"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.CloudTest/pools (delegation-14) service_delegation actions are not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-15"].delegation[0].service_delegation[0].name == "Microsoft.Codespaces/plans"
  #   error_message = "plan: delegation Microsoft.Codespaces/plans (delegation-15) service_delegation name is not as expected."
  # }

  # assert {
  #   condition     = sort(azurerm_subnet.subnets["delegation-15"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
  #   error_message = "plan: delegation Microsoft.Codespaces/plans (delegation-15) service_delegation actions are not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-16"].delegation[0].service_delegation[0].name == "Microsoft.ContainerInstance/containerGroups"
    error_message = "plan: delegation Microsoft.ContainerInstance/containerGroups (delegation-16) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-16"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.ContainerInstance/containerGroups (delegation-16) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-17"].delegation[0].service_delegation[0].name == "Microsoft.ContainerService/managedClusters"
    error_message = "plan: delegation Microsoft.ContainerService/managedClusters (delegation-17) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-17"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.ContainerService/managedClusters (delegation-17) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-18"].delegation[0].service_delegation[0].name == "Microsoft.Databricks/workspaces"
    error_message = "plan: delegation Microsoft.Databricks/workspaces (delegation-18) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-18"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"])
    error_message = "plan: delegation Microsoft.Databricks/workspaces (delegation-18) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-19"].delegation[0].service_delegation[0].name == "Microsoft.DBforMySQL/flexibleServers"
    error_message = "plan: delegation Microsoft.DBforMySQL/flexibleServers (delegation-19) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-19"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforMySQL/flexibleServers (delegation-19) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-20"].delegation[0].service_delegation[0].name == "Microsoft.DBforMySQL/servers"
    error_message = "plan: delegation Microsoft.DBforMySQL/servers (delegation-20) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-20"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforMySQL/servers (delegation-20) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-21"].delegation[0].service_delegation[0].name == "Microsoft.DBforMySQL/serversv2"
    error_message = "plan: delegation Microsoft.DBforMySQL/serversv2 (delegation-21) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-21"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforMySQL/serversv2 (delegation-21) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-22"].delegation[0].service_delegation[0].name == "Microsoft.DBforPostgreSQL/flexibleServers"
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/flexibleServers (delegation-22) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-22"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/flexibleServers (delegation-22) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-23"].delegation[0].service_delegation[0].name == "Microsoft.DBforPostgreSQL/serversv2"
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/serversv2 (delegation-23) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-23"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/serversv2 (delegation-23) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-24"].delegation[0].service_delegation[0].name == "Microsoft.DBforPostgreSQL/singleServers"
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/singleServers (delegation-24) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-24"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DBforPostgreSQL/singleServers (delegation-24) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-25"].delegation[0].service_delegation[0].name == "Microsoft.DelegatedNetwork/controller"
    error_message = "plan: delegation Microsoft.DelegatedNetwork/controller (delegation-25) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-25"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DelegatedNetwork/controller (delegation-25) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-26"].delegation[0].service_delegation[0].name == "Microsoft.DevCenter/networkConnection"
    error_message = "plan: delegation Microsoft.DevCenter/networkConnection (delegation-26) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-26"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DevCenter/networkConnection (delegation-26) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-27"].delegation[0].service_delegation[0].name == "Microsoft.DevOpsInfrastructure/pools"
    error_message = "plan: delegation Microsoft.DevOpsInfrastructure/pools (delegation-27) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-27"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DevOpsInfrastructure/pools (delegation-27) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-28"].delegation[0].service_delegation[0].name == "Microsoft.DocumentDB/cassandraClusters"
    error_message = "plan: delegation Microsoft.DocumentDB/cassandraClusters (delegation-28) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-28"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.DocumentDB/cassandraClusters (delegation-28) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-29"].delegation[0].service_delegation[0].name == "Microsoft.Fidalgo/networkSettings"
    error_message = "plan: delegation Microsoft.Fidalgo/networkSettings (delegation-29) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-29"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Fidalgo/networkSettings (delegation-29) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-30"].delegation[0].service_delegation[0].name == "Microsoft.HardwareSecurityModules/dedicatedHSMs"
    error_message = "plan: delegation Microsoft.HardwareSecurityModules/dedicatedHSMs (delegation-30) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-30"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.HardwareSecurityModules/dedicatedHSMs (delegation-30) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-31"].delegation[0].service_delegation[0].name == "Microsoft.Kusto/clusters"
    error_message = "plan: delegation Microsoft.Kusto/clusters (delegation-31) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-31"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"])
    error_message = "plan: delegation Microsoft.Kusto/clusters (delegation-31) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-32"].delegation[0].service_delegation[0].name == "Microsoft.LabServices/labplans"
    error_message = "plan: delegation Microsoft.LabServices/labplans (delegation-32) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-32"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.LabServices/labplans (delegation-32) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-33"].delegation[0].service_delegation[0].name == "Microsoft.Logic/integrationServiceEnvironments"
    error_message = "plan: delegation Microsoft.Logic/integrationServiceEnvironments (delegation-33) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-33"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.Logic/integrationServiceEnvironments (delegation-33) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-34"].delegation[0].service_delegation[0].name == "Microsoft.MachineLearningServices/workspaces"
    error_message = "plan: delegation Microsoft.MachineLearningServices/workspaces (delegation-34) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-34"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.MachineLearningServices/workspaces (delegation-34) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-35"].delegation[0].service_delegation[0].name == "Microsoft.MessagingConnectors/connectors"
    error_message = "plan: delegation Microsoft.MessagingConnectors/connectors (delegation-35) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-35"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.MessagingConnectors/connectors (delegation-35) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-36"].delegation[0].service_delegation[0].name == "Microsoft.Netapp/volumes"
    error_message = "plan: delegation Microsoft.Netapp/volumes (delegation-36) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-36"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Netapp/volumes (delegation-36) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-37"].delegation[0].service_delegation[0].name == "Microsoft.Network/applicationGateways"
    error_message = "plan: delegation Microsoft.Network/applicationGateways (delegation-37) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-37"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Network/applicationGateways (delegation-37) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-38"].delegation[0].service_delegation[0].name == "Microsoft.Network/dnsResolvers"
    error_message = "plan: delegation Microsoft.Network/dnsResolvers (delegation-38) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-38"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Network/dnsResolvers (delegation-38) service_delegation actions are not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-39"].delegation[0].service_delegation[0].name == "Microsoft.Network/networkWatchers"
  #   error_message = "plan: delegation Microsoft.Network/networkWatchers (delegation-39) service_delegation name is not as expected."
  # }

  # assert {
  #   condition     = sort(azurerm_subnet.subnets["delegation-39"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
  #   error_message = "plan: delegation Microsoft.Network/networkWatchers (delegation-39) service_delegation actions are not as expected."
  # }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-40"].delegation[0].service_delegation[0].name == "Microsoft.Orbital/orbitalGateways"
  #   error_message = "plan: delegation Microsoft.Orbital/orbitalGateways (delegation-40) service_delegation name is not as expected."
  # }

  # assert {
  #   condition     = sort(azurerm_subnet.subnets["delegation-40"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/publicIPAddresses/join/action", "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/read", "Microsoft.Network/publicIPAddresses/read"])
  #   error_message = "plan: delegation Microsoft.Orbital/orbitalGateways (delegation-40) service_delegation actions are not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-41"].delegation[0].service_delegation[0].name == "Microsoft.PowerAutomate/hostedRpa"
    error_message = "plan: delegation Microsoft.PowerAutomate/hostedRpa (delegation-41) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-41"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.PowerAutomate/hostedRpa (delegation-41) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-42"].delegation[0].service_delegation[0].name == "Microsoft.PowerPlatform/enterprisePolicies"
    error_message = "plan: delegation Microsoft.PowerPlatform/enterprisePolicies (delegation-42) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-42"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.PowerPlatform/enterprisePolicies (delegation-42) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-43"].delegation[0].service_delegation[0].name == "Microsoft.PowerPlatform/vnetaccesslinks"
    error_message = "plan: delegation Microsoft.PowerPlatform/vnetaccesslinks (delegation-43) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-43"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.PowerPlatform/vnetaccesslinks (delegation-43) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-44"].delegation[0].service_delegation[0].name == "Microsoft.ServiceFabricMesh/networks"
    error_message = "plan: delegation Microsoft.ServiceFabricMesh/networks (delegation-44) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-44"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.ServiceFabricMesh/networks (delegation-44) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-45"].delegation[0].service_delegation[0].name == "Microsoft.ServiceNetworking/trafficControllers"
    error_message = "plan: delegation Microsoft.ServiceNetworking/trafficControllers (delegation-45) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-45"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.ServiceNetworking/trafficControllers (delegation-45) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-46"].delegation[0].service_delegation[0].name == "Microsoft.Singularity/accounts/networks"
    error_message = "plan: delegation Microsoft.Singularity/accounts/networks (delegation-46) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-46"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Singularity/accounts/networks (delegation-46) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-47"].delegation[0].service_delegation[0].name == "Microsoft.Singularity/accounts/npu"
    error_message = "plan: delegation Microsoft.Singularity/accounts/npu (delegation-47) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-47"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Singularity/accounts/npu (delegation-47) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-48"].delegation[0].service_delegation[0].name == "Microsoft.Sql/managedInstances"
    error_message = "plan: delegation Microsoft.Sql/managedInstances (delegation-48) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-48"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"])
    error_message = "plan: delegation Microsoft.Sql/managedInstances (delegation-48) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-49"].delegation[0].service_delegation[0].name == "Microsoft.StoragePool/diskPools"
    error_message = "plan: delegation Microsoft.StoragePool/diskPools (delegation-49) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-49"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/read"])
    error_message = "plan: delegation Microsoft.StoragePool/diskPools (delegation-49) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-50"].delegation[0].service_delegation[0].name == "Microsoft.StreamAnalytics/streamingJobs"
    error_message = "plan: delegation Microsoft.StreamAnalytics/streamingJobs (delegation-50) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-50"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.StreamAnalytics/streamingJobs (delegation-50) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-51"].delegation[0].service_delegation[0].name == "Microsoft.Synapse/workspaces"
    error_message = "plan: delegation Microsoft.Synapse/workspaces (delegation-51) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-51"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Microsoft.Synapse/workspaces (delegation-51) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-52"].delegation[0].service_delegation[0].name == "Microsoft.Web/hostingEnvironments"
    error_message = "plan: delegation Microsoft.Web/hostingEnvironments (delegation-52) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-52"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.Web/hostingEnvironments (delegation-52) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-53"].delegation[0].service_delegation[0].name == "Microsoft.Web/serverFarms"
    error_message = "plan: delegation Microsoft.Web/serverFarms (delegation-53) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-53"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/action"])
    error_message = "plan: delegation Microsoft.Web/serverFarms (delegation-53) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-54"].delegation[0].service_delegation[0].name == "NGINX.NGINXPLUS/nginxDeployments"
    error_message = "plan: delegation NGINX.NGINXPLUS/nginxDeployments (delegation-54) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-54"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation NGINX.NGINXPLUS/nginxDeployments (delegation-54) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-55"].delegation[0].service_delegation[0].name == "Oracle.Database/networkAttachments"
    error_message = "plan: delegation Oracle.Database/networkAttachments (delegation-55) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-55"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Oracle.Database/networkAttachments (delegation-55) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-56"].delegation[0].service_delegation[0].name == "PaloAltoNetworks.Cloudngfw/firewalls"
    error_message = "plan: delegation PaloAltoNetworks.Cloudngfw/firewalls (delegation-56) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-56"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation PaloAltoNetworks.Cloudngfw/firewalls (delegation-56) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-57"].delegation[0].service_delegation[0].name == "PureStorage.Block/storagePools"
    error_message = "plan: delegation PureStorage.Block/storagePools (delegation-57) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-57"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation PureStorage.Block/storagePools (delegation-57) service_delegation actions are not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-58"].delegation[0].service_delegation[0].name == "Qumulo.Storage/fileSystems"
    error_message = "plan: delegation Qumulo.Storage/fileSystems (delegation-58) service_delegation name is not as expected."
  }

  assert {
    condition     = sort(azurerm_subnet.subnets["delegation-58"].delegation[0].service_delegation[0].actions) == sort(["Microsoft.Network/virtualNetworks/subnets/join/action"])
    error_message = "plan: delegation Qumulo.Storage/fileSystems (delegation-58) service_delegation actions are not as expected."
  }
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-00"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-00"
    error_message = "apply: delegation GitHub.Network/networkSettings (delegation-00) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-01"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-01"
    error_message = "apply: delegation Informatica.DataManagement/organizations (delegation-01) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-02"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-02"
    error_message = "apply: delegation Microsoft.ApiManagement/service (delegation-02) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-03"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-03"
    error_message = "apply: delegation Microsoft.Apollo/npu (delegation-03) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-04"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-04"
    error_message = "apply: delegation Microsoft.App/environments (delegation-04) ID is not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-05"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-05"
  #   error_message = "apply: delegation Microsoft.App/testClients (delegation-05) ID is not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-06"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-06"
    error_message = "apply: delegation Microsoft.AVS/PrivateClouds (delegation-06) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-07"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-07"
    error_message = "apply: delegation Microsoft.AzureCosmosDB/clusters (delegation-07) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-08"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-08"
    error_message = "apply: delegation Microsoft.BareMetal/AzureHostedService (delegation-08) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-09"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-09"
    error_message = "apply: delegation Microsoft.BareMetal/AzureVMware (delegation-09) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-10"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-10"
    error_message = "apply: delegation Microsoft.BareMetal/CrayServers (delegation-10) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-11"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-11"
    error_message = "apply: delegation Microsoft.Batch/batchAccounts (delegation-11) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-12"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-12"
    error_message = "apply: delegation Microsoft.CloudTest/hostedpools (delegation-12) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-13"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-13"
    error_message = "apply: delegation Microsoft.CloudTest/images (delegation-13) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-14"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-14"
    error_message = "apply: delegation Microsoft.CloudTest/pools (delegation-14) ID is not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-15"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-15"
  #   error_message = "apply: delegation Microsoft.Codespaces/plans (delegation-15) ID is not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-16"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-16"
    error_message = "apply: delegation Microsoft.ContainerInstance/containerGroups (delegation-16) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-17"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-17"
    error_message = "apply: delegation Microsoft.ContainerService/managedClusters (delegation-17) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-18"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-18"
    error_message = "apply: delegation Microsoft.Databricks/workspaces (delegation-18) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-19"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-19"
    error_message = "apply: delegation Microsoft.DBforMySQL/flexibleServers (delegation-19) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-20"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-20"
    error_message = "apply: delegation Microsoft.DBforMySQL/servers (delegation-20) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-21"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-21"
    error_message = "apply: delegation Microsoft.DBforMySQL/serversv2 (delegation-21) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-22"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-22"
    error_message = "apply: delegation Microsoft.DBforPostgreSQL/flexibleServers (delegation-22) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-23"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-23"
    error_message = "apply: delegation Microsoft.DBforPostgreSQL/serversv2 (delegation-23) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-24"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-24"
    error_message = "apply: delegation Microsoft.DBforPostgreSQL/singleServers (delegation-24) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-25"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-25"
    error_message = "apply: delegation Microsoft.DelegatedNetwork/controller (delegation-25) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-26"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-26"
    error_message = "apply: delegation Microsoft.DevCenter/networkConnection (delegation-26) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-27"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-27"
    error_message = "apply: delegation Microsoft.DevOpsInfrastructure/pools (delegation-27) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-28"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-28"
    error_message = "apply: delegation Microsoft.DocumentDB/cassandraClusters (delegation-28) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-29"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-29"
    error_message = "apply: delegation Microsoft.Fidalgo/networkSettings (delegation-29) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-30"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-30"
    error_message = "apply: delegation Microsoft.HardwareSecurityModules/dedicatedHSMs (delegation-30) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-31"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-31"
    error_message = "apply: delegation Microsoft.Kusto/clusters (delegation-31) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-32"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-32"
    error_message = "apply: delegation Microsoft.LabServices/labplans (delegation-32) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-33"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-33"
    error_message = "apply: delegation Microsoft.Logic/integrationServiceEnvironments (delegation-33) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-34"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-34"
    error_message = "apply: delegation Microsoft.MachineLearningServices/workspaces (delegation-34) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-35"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-35"
    error_message = "apply: delegation Microsoft.MessagingConnectors/connectors (delegation-35) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-36"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-36"
    error_message = "apply: delegation Microsoft.Netapp/volumes (delegation-36) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-37"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-37"
    error_message = "apply: delegation Microsoft.Network/applicationGateways (delegation-37) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-38"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-38"
    error_message = "apply: delegation Microsoft.Network/dnsResolvers (delegation-38) ID is not as expected."
  }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-39"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-39"
  #   error_message = "apply: delegation Microsoft.Network/networkWatchers (delegation-39) ID is not as expected."
  # }

  # assert {
  #   condition     = azurerm_subnet.subnets["delegation-40"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-40"
  #   error_message = "apply: delegation Microsoft.Orbital/orbitalGateways (delegation-40) ID is not as expected."
  # }

  assert {
    condition     = azurerm_subnet.subnets["delegation-41"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-41"
    error_message = "apply: delegation Microsoft.PowerAutomate/hostedRpa (delegation-41) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-42"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-42"
    error_message = "apply: delegation Microsoft.PowerPlatform/enterprisePolicies (delegation-42) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-43"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-43"
    error_message = "apply: delegation Microsoft.PowerPlatform/vnetaccesslinks (delegation-43) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-44"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-44"
    error_message = "apply: delegation Microsoft.ServiceFabricMesh/networks (delegation-44) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-45"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-45"
    error_message = "apply: delegation Microsoft.ServiceNetworking/trafficControllers (delegation-45) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-46"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-46"
    error_message = "apply: delegation Microsoft.Singularity/accounts/networks (delegation-46) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-47"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-47"
    error_message = "apply: delegation Microsoft.Singularity/accounts/npu (delegation-47) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-48"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-48"
    error_message = "apply: delegation Microsoft.Sql/managedInstances (delegation-48) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-49"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-49"
    error_message = "apply: delegation Microsoft.StoragePool/diskPools (delegation-49) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-50"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-50"
    error_message = "apply: delegation Microsoft.StreamAnalytics/streamingJobs (delegation-50) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-51"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-51"
    error_message = "apply: delegation Microsoft.Synapse/workspaces (delegation-51) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-52"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-52"
    error_message = "apply: delegation Microsoft.Web/hostingEnvironments (delegation-52) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-53"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-53"
    error_message = "apply: delegation Microsoft.Web/serverFarms (delegation-53) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-54"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-54"
    error_message = "apply: delegation NGINX.NGINXPLUS/nginxDeployments (delegation-54) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-55"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-55"
    error_message = "apply: delegation Oracle.Database/networkAttachments (delegation-55) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-56"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-56"
    error_message = "apply: delegation PaloAltoNetworks.Cloudngfw/firewalls (delegation-56) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-57"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-57"
    error_message = "apply: delegation PureStorage.Block/storagePools (delegation-57) ID is not as expected."
  }

  assert {
    condition     = azurerm_subnet.subnets["delegation-58"].id == "${run.setup.resource_group_id}/providers/Microsoft.Network/virtualNetworks/${run.setup.workspace_id}/subnets/delegation-58"
    error_message = "apply: delegation Qumulo.Storage/fileSystems (delegation-58) ID is not as expected."
  }
}
