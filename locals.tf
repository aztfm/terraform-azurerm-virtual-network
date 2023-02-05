locals {
  service_delegation_actions = {
    "Microsoft.ApiManagement/service"                 = ["virtualNetworks/subnets/join/action", "virtualNetworks/subnets/prepareNetworkPolicies/action"]
    "Microsoft.AzureCosmosDB/clusters"                = ["virtualNetworks/subnets/join/action"]
    "Microsoft.BareMetal/AzureVMware"                 = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.BareMetal/CrayServers"                 = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Batch/batchAccounts"                   = ["virtualNetworks/subnets/action"]
    "Microsoft.ContainerInstance/containerGroups"     = ["virtualNetworks/subnets/action"]
    "Microsoft.ContainerService/managedClusters"      = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Databricks/workspaces"                 = formatlist("virtualNetworks/subnets/%s", ["join/action", "prepareNetworkPolicies/action", "unprepareNetworkPolicies/action"])
    "Microsoft.DBforMySQL/flexibleServers"            = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforMySQL/serversv2"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/flexibleServers"       = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/serversv2"             = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/singleServers"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.HardwareSecurityModules/dedicatedHSMs" = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Kusto/clusters"                        = formatlist("virtualNetworks/subnets/%s", ["join/action", "prepareNetworkPolicies/action", "unprepareNetworkPolicies/action"])
    "Microsoft.Logic/integrationServiceEnvironments"  = ["virtualNetworks/subnets/action"]
    "Microsoft.LabServices/labplans"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.MachineLearningServices/workspaces"    = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Netapp/volumes"                        = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Orbital/orbitalGateways"               = ["publicIPAddresses/join/action", "virtualNetworks/subnets/join/action", "virtualNetworks/read", "publicIPAddresses/read"]
    "Microsoft.PowerPlatform/vnetaccesslinks"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.ServiceFabricMesh/networks"            = ["virtualNetworks/subnets/action"]
    "Microsoft.Sql/managedInstances"                  = formatlist("virtualNetworks/subnets/%s", ["join/action", "prepareNetworkPolicies/action", "unprepareNetworkPolicies/action"])
    "Microsoft.StoragePool/diskPools"                 = ["virtualNetworks/read"]
    "Microsoft.StreamAnalytics/streamingJobs"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Synapse/workspaces"                    = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Web/hostingEnvironments"               = ["virtualNetworks/subnets/action"]
    "Microsoft.Web/serverFarms"                       = ["virtualNetworks/subnets/action"]
    "NGINX.NGINXPLUS/nginxDeployments"                = ["virtualNetworks/subnets/join/action"]
    "PaloAltoNetworks.Cloudngfw/firewalls"            = ["virtualNetworks/subnets/join/action"]
  }
}
