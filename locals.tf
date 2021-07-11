locals {
  service_delegation_actions = {
    "Microsoft.BareMetal/AzureVMware"                 = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.BareMetal/CrayServers"                 = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Batch/batchAccounts"                   = ["virtualNetworks/subnets/action"]
    "Microsoft.ContainerInstance/containerGroups"     = ["virtualNetworks/subnets/action"]
    "Microsoft.Databricks/workspaces"                 = formatlist("virtualNetworks/subnets/%s", ["join/action", "prepareNetworkPolicies/action", "unprepareNetworkPolicies/action"])
    "Microsoft.DBforPostgreSQL/serversv2"             = ["virtualNetworks/subnets/join/action"]
    "Microsoft.HardwareSecurityModules/dedicatedHSMs" = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Logic/integrationServiceEnvironments"  = ["virtualNetworks/subnets/action"]
    "Microsoft.Netapp/volumes"                        = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.ServiceFabricMesh/networks"            = ["virtualNetworks/subnets/action"]
    "Microsoft.Sql/managedInstances"                  = formatlist("virtualNetworks/subnets/%s", ["join/action", "prepareNetworkPolicies/action", "unprepareNetworkPolicies/action"])
    "Microsoft.StreamAnalytics/streamingJobs"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Web/hostingEnvironments"               = ["virtualNetworks/subnets/action"]
    "Microsoft.Web/serverFarms"                       = ["virtualNetworks/subnets/action"]
  }
}
