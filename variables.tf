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
    condition = alltrue([for subnet in var.subnets : contains([
      "GitHub.Network/networkSettings", "Informatica.DataManagement/organizations", "Microsoft.ApiManagement/service",
      "Microsoft.Apollo/npu", "Microsoft.App/environments", "Microsoft.App/testClients", "Microsoft.AVS/PrivateClouds",
      "Microsoft.AzureCosmosDB/clusters", "Microsoft.BareMetal/AzureHostedService", "Microsoft.BareMetal/AzureVMware",
      "Microsoft.BareMetal/CrayServers", "Microsoft.Batch/batchAccounts", "Microsoft.CloudTest/hostedpools",
      "Microsoft.CloudTest/images", "Microsoft.CloudTest/pools", "Microsoft.Codespaces/plans", "Microsoft.ContainerInstance/containerGroups",
      "Microsoft.ContainerService/managedClusters", "Microsoft.Databricks/workspaces", "Microsoft.DBforMySQL/flexibleServers",
      "Microsoft.DBforMySQL/servers", "Microsoft.DBforMySQL/serversv2", "Microsoft.DBforPostgreSQL/flexibleServers", "Microsoft.DBforPostgreSQL/serversv2",
      "Microsoft.DBforPostgreSQL/singleServers", "Microsoft.DelegatedNetwork/controller", "Microsoft.DevCenter/networkConnection", "Microsoft.DevOpsInfrastructure/pools",
      "Microsoft.DocumentDB/cassandraClusters", "Microsoft.Fidalgo/networkSettings", "Microsoft.HardwareSecurityModules/dedicatedHSMs", "Microsoft.Kusto/clusters",
      "Microsoft.LabServices/labplans", "Microsoft.Logic/integrationServiceEnvironments", "Microsoft.MachineLearningServices/workspaces", "Microsoft.Netapp/volumes",
      "Microsoft.Network/applicationGateways", "Microsoft.Network/dnsResolvers", "Microsoft.Network/networkWatchers", "Microsoft.Orbital/orbitalGateways",
      "Microsoft.PowerAutomate/hostedRpa", "Microsoft.PowerPlatform/enterprisePolicies", "Microsoft.PowerPlatform/vnetaccesslinks",
      "Microsoft.ServiceFabricMesh/networks", "Microsoft.ServiceNetworking/trafficControllers", "Microsoft.Singularity/accounts/networks",
      "Microsoft.Singularity/accounts/npu", "Microsoft.Sql/managedInstances", "Microsoft.StoragePool/diskPools", "Microsoft.StreamAnalytics/streamingJobs",
      "Microsoft.Synapse/workspaces", "Microsoft.Web/hostingEnvironments", "Microsoft.Web/serverFarms", "NGINX.NGINXPLUS/nginxDeployments",
      "PaloAltoNetworks.Cloudngfw/firewalls", "Qumulo.Storage/fileSystems", "Oracle.Database/networkAttachments"
    ], subnet.delegation) if subnet.delegation != null])
    error_message = "All delegation values must be one of the allowed service delegations."
  }
}
