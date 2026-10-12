variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  description = "The location/region where the virtual network is created."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the virtual network. More than one address space can be provisioned."

  validation {
    condition     = can([for ip in var.address_space : cidrsubnet(ip, 0, 0)])
    error_message = "All value must be a valid IP range in CIDR format."
  }
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "List of IP addresses of DNS servers."

  validation {
    condition     = can([for ip in var.dns_servers : cidrnetmask("${ip}/32")])
    error_message = "All value must be a valid IP address."
  }
}

variable "ddos_protection_plan_id" {
  type        = string
  default     = null
  description = "The ID of DDoS Protection Plan."
}

variable "bgp_community" {
  type        = string
  default     = null
  description = "The BGP community attribute in format `<as-number>:<community-value>`. The as-number segment is the Microsoft ASN, which is always 12076 for now."

  validation {
    condition     = var.bgp_community == null ? true : length(split(":", var.bgp_community)) == 2
    error_message = "The value must be a BGP community range in <as-number>:<community-value> format."
  }

  validation {
    condition     = var.bgp_community == null ? true : split(":", var.bgp_community)[0] == "12076"
    error_message = "The as-number must be 12076."
  }

  validation {
    condition     = var.bgp_community == null ? true : split(":", var.bgp_community)[1] >= 20000 && split(":", var.bgp_community)[1] <= 49999
    error_message = "The community-value must between 20000 and 49999."
  }
}

variable "encryption_mode" {
  type        = string
  default     = null
  description = "The encryption mode for the virtual network. Possible values are 'AllowUnencrypted' or 'DropUnencrypted'."

  validation {
    condition     = var.encryption_mode == null || contains(["AllowUnencrypted", "DropUnencrypted"], var.encryption_mode)
    error_message = "The encryption mode must be either 'AllowUnencrypted' or 'DropUnencrypted'."
  }
}

variable "service_delegation_actions" {
  type  = map(list(string))
  default = {
    "GitHub.Network/networkSettings"           = ["virtualNetworks/subnets/join/action"]
    "Informatica.DataManagement/organizations" = ["virtualNetworks/subnets/join/action"]
    "Microsoft.ApiManagement/service"          = ["virtualNetworks/subnets/join/action", "virtualNetworks/subnets/prepareNetworkPolicies/action"]
    "Microsoft.Apollo/npu"                     = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.App/environments"               = ["virtualNetworks/subnets/join/action"]
    "Microsoft.App/testClients"                = ["virtualNetworks/subnets/join/action"]
    "Microsoft.AVS/PrivateClouds"              = ["networkinterfaces/*"]
    "Microsoft.AzureCosmosDB/clusters"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.BareMetal/AzureHostedService"   = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    # "Microsoft.BareMetal/AzureHPC"        = [] # Need Microsoft.Network/AllowInternalDelegations
    # "Microsoft.BareMetal/AzurePaymentHSM" = [] # Need Microsoft.Network/AllowInternalDelegations
    "Microsoft.BareMetal/AzureVMware" = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.BareMetal/CrayServers" = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    # "Microsoft.BareMetal/MonitoringServers" = [] # Need Microsoft.Network/AllowInternalDelegations
    "Microsoft.Batch/batchAccounts"               = ["virtualNetworks/subnets/action"]
    "Microsoft.CloudTest/hostedpools"             = ["virtualNetworks/subnets/join/action"]
    "Microsoft.CloudTest/images"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.CloudTest/pools"                   = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Codespaces/plans"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.ContainerInstance/containerGroups" = ["virtualNetworks/subnets/action"]
    "Microsoft.ContainerService/managedClusters"  = ["virtualNetworks/subnets/join/action"]
    # "Microsoft.ContainerService/TestClients" = [] # Need Microsoft.Network/AllowInternalDelegations
    "Microsoft.Databricks/workspaces"                 = ["virtualNetworks/subnets/join/action", "virtualNetworks/subnets/prepareNetworkPolicies/action", "virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    "Microsoft.DBforMySQL/flexibleServers"            = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforMySQL/servers"                    = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforMySQL/serversv2"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/flexibleServers"       = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/serversv2"             = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DBforPostgreSQL/singleServers"         = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DelegatedNetwork/controller"           = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DevCenter/networkConnection"           = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DevOpsInfrastructure/pools"            = ["virtualNetworks/subnets/join/action"]
    "Microsoft.DocumentDB/cassandraClusters"          = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Fidalgo/networkSettings"               = ["virtualNetworks/subnets/join/action"]
    "Microsoft.HardwareSecurityModules/dedicatedHSMs" = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Kusto/clusters"                        = ["virtualNetworks/subnets/join/action", "virtualNetworks/subnets/prepareNetworkPolicies/action", "virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    "Microsoft.LabServices/labplans"                  = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Logic/integrationServiceEnvironments"  = ["virtualNetworks/subnets/action"]
    "Microsoft.MachineLearningServices/workspaces"    = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Netapp/volumes"                        = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Network/applicationGateways"           = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Network/dnsResolvers"                  = ["virtualNetworks/subnets/join/action"]
    # "Microsoft.Network/managedResolvers"      = [] # Not supported by Azure
    # "Microsoft.Network/fpgaNetworkInterfaces" = [] # Need Microsoft.Network/AllowInternalDelegations
    "Microsoft.Network/networkWatchers" = ["virtualNetworks/subnets/join/action"]
    # "Microsoft.Network/virtualNetworkGateways" = [] # InternalServerError
    "Microsoft.Orbital/orbitalGateways"              = ["publicIPAddresses/join/action", "virtualNetworks/subnets/join/action", "virtualNetworks/read", "publicIPAddresses/read"]
    "Microsoft.PowerAutomate/hostedRpa"              = ["virtualNetworks/subnets/join/action"]
    "Microsoft.PowerPlatform/enterprisePolicies"     = ["virtualNetworks/subnets/join/action"]
    "Microsoft.PowerPlatform/vnetaccesslinks"        = ["virtualNetworks/subnets/join/action"]
    "Microsoft.ServiceFabricMesh/networks"           = ["virtualNetworks/subnets/action"]
    "Microsoft.ServiceNetworking/trafficControllers" = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Singularity/accounts/networks"        = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Singularity/accounts/npu"             = ["networkinterfaces/*", "virtualNetworks/subnets/join/action"]
    "Microsoft.Sql/managedInstances"                 = ["virtualNetworks/subnets/join/action", "virtualNetworks/subnets/prepareNetworkPolicies/action", "virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    # "Microsoft.Sql/managedInstancesOnebox" = [] # Need Microsoft.Network/AllowInternalDelegations
    # "Microsoft.Sql/managedInstancesStage"  = [] # Need Microsoft.Network/AllowInternalDelegations
    # "Microsoft.Sql/managedInstancesTest"   = [] # Need Microsoft.Network/AllowInternalDelegations
    # "Microsoft.Sql/servers"                = [] # Not supported by Azure
    "Microsoft.StoragePool/diskPools"         = ["virtualNetworks/read"]
    "Microsoft.StreamAnalytics/streamingJobs" = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Synapse/workspaces"            = ["virtualNetworks/subnets/join/action"]
    "Microsoft.Web/hostingEnvironments"       = ["virtualNetworks/subnets/action"]
    "Microsoft.Web/serverFarms"               = ["virtualNetworks/subnets/action"]
    "NGINX.NGINXPLUS/nginxDeployments"        = ["virtualNetworks/subnets/join/action"]
    "PaloAltoNetworks.Cloudngfw/firewalls"    = ["virtualNetworks/subnets/join/action"]
    "Qumulo.Storage/fileSystems"              = ["virtualNetworks/subnets/join/action"]
    "Oracle.Database/networkAttachments"      = ["virtualNetworks/subnets/join/action"]
  }
}

variable "subnets" {
  type = list(object({
    name                                          = string
    address_prefixes                              = list(string)
    default_outbound_access_enabled               = optional(bool, false)
    service_endpoints                             = optional(list(string))
    delegation                                    = optional(string)
    private_endpoint_network_policies             = optional(string, "Disabled")
    private_link_service_network_policies_enabled = optional(bool)
  }))
  default     = []
  description = "List of objects that represent the configuration of each subnet."
  validation {
    condition     = alltrue([for subnet in var.subnets : can([for ip in subnet.address_prefixes : cidrsubnet(ip, 0, 0)])])
    error_message = "All address prefixes must be valid IP ranges in CIDR format."
  }

  validation {
    condition = alltrue([for subnet in var.subnets : alltrue([for endpoint in subnet.service_endpoints : contains([
      "Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.ContainerRegistry",
      "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Sql",
      "Microsoft.Storage", "Microsoft.Storage.Global", "Microsoft.Web"
    ], endpoint)]) if subnet.service_endpoints != null])
    error_message = "All service endpoints must be one of the following: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, or Microsoft.Web."
  }

  validation {
    condition     = alltrue([for subnet in var.subnets : contains(["Disabled", "Enabled", "NetworkSecurityGroupEnabled", "RouteTableEnabled"], subnet.private_endpoint_network_policies)])
    error_message = "All private endpoint network policies must be Disabled, Enabled, NetworkSecurityGroupEnabled, or RouteTableEnabled."
  }

  validation {
    condition = alltrue([for subnet in var.subnets : contains(keys(var.service_delegation_actions), subnet.delegation) if subnet.delegation != null])
    error_message = "All delegation values must be one of the allowed service delegations."
  }
}
