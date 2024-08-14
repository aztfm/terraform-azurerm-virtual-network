<!-- markdownlint-disable MD041 -->
## 4.0.0 (January 07, 2024)

BREAKING CHANGES:

- dependencies: updating to `v3.58.0` minimum of `hashicorp/azurerm` provider.

ENHANCEMENTS:

- Internal changes that do not modify the operation of the module.
- New options have been added to the `subnets.delegation` parameter: `GitHub.Network/networkSettings`, `Microsoft.Apollo/npu`, `Microsoft.App/environments`, `Microsoft.App/testClients`, `Microsoft.AVS/PrivateClouds`, `Microsoft.BareMetal/AzureHostedService`, `Microsoft.CloudTest/hostedpools`, `Microsoft.CloudTest/images`, `Microsoft.CloudTest/pools`, `Microsoft.Codespaces/plans`, `Microsoft.DBforMySQL/servers`, `Microsoft.DelegatedNetwork/controller`, `Microsoft.DevCenter/networkConnection`, `Microsoft.DocumentDB/cassandraClusters`, `Microsoft.Fidalgo/networkSettings`, `Microsoft.LabServices/labplans`, `Microsoft.Network/dnsResolvers`, `Microsoft.PowerPlatform/enterprisePolicies`, `Microsoft.ServiceNetworking/trafficControllers`, `Microsoft.Singularity/accounts/networks`, `Microsoft.Singularity/accounts/npu` and `Qumulo.Storage/fileSystems`.

## 3.0.0 (February 05, 2023)

BREAKING CHANGES:

- dependencies: updating to `v1.3.0` minimum of `terraform`.
- dependencies: updating to `v3.28.0` minimum of `hashicorp/azurerm` provider.

ENHANCEMENTS:

- Internal changes that change the way data is received by child parameters, but do not change the behavior of the module.
- New options have been added to the `subnets.delegation` parameter: `Microsoft.ContainerService/managedClusters`, `Microsoft.LabServices/labplans`, `Microsoft.Orbital/orbitalGateways`, `Microsoft.StoragePool/diskPools`, `NGINX.NGINXPLUS/nginxDeployments` and `PaloAltoNetworks.Cloudngfw/firewalls`.

## 2.0.1 (November 27, 2021)

ENHANCEMENTS:

- Internal changes that do not modify the operation of the module.

## 2.0.0 (July 22, 2021)

BREAKING CHANGES:

- dependencies: updating to `v2.36.0` minimum of `hashicorp/azurerm` provider.
- The internal name by which the `azurerm_subnet` resource is defined was defined as `vnet`. This has been changed by `subnets` to maintain the internal consistency of the module, so the resources deployed in the previous version of the module are not compatible with this new version.
- The `subnet.address_prefix` parameter is now `subnet.address_prefixes` and changes from type `string` to `list(string)`.
- The parameter `subnet.service endpoints` changes type `string` to `list (string)`.

FEATURES:

- **New Parameter:** `bgp_community`

ENHANCEMENTS:

- New options have been added to the `subnets.delegation` parameter: `Microsoft.ApiManagement/service`, `Microsoft.AzureCosmosDB/clusters`, `Microsoft.DBforMySQL/flexibleServers`, `Microsoft.DBforMySQL/serversv2`, `Microsoft.DBforPostgreSQL/flexibleServers`, `Microsoft.DBforPostgreSQL/singleServers`, `Microsoft.Kusto/clusters`, `Microsoft.MachineLearningServices/workspaces`, `Microsoft.PowerPlatform/vnetaccesslinks` and `Microsoft.Synapse/workspaces`.

## 1.3.0 (July 11, 2021)

FEATURES:

- **New Parameter:** `subnets.enforce_private_link_service_network_policies`
- **New Parameter:** `subnets.enforce_private_link_endpoint_network_policies`
- **New Parameter:** `subnets.delegation`: The delegation of the services of `Microsoft.BareMetal/AzureVMware`, `Microsoft.BareMetal/CrayServers`, `Microsoft.Batch/batchAccounts`, `Microsoft.ContainerInstance/containerGroups`, `Microsoft.Databricks/workspaces`, `Microsoft.DBforPostgreSQL/serversv2`, `Microsoft.HardwareSecurityModules/dedicatedHSMs`, `Microsoft.Logic/integrationServiceEnvironments`, `Microsoft.Netapp/volumes`, `Microsoft.ServiceFabricMesh/networks`, `Microsoft.Sql/managedInstances`, `Microsoft.StreamAnalytics/streamingJobs`, `Microsoft.Web/hostingEnvironments` and `Microsoft.Web/serverFarms`.

BUG FIXES:

- The `lifecycle` property has been removed both because there are parameters that have been added to the module, and parameters that are not compatible with the minimum version of the module.

## 1.2.0 (March 11, 2021)

FEATURES:

- **New Parameter:** `subnets.service_endpoints`

ENHANCEMENTS:

- The `lifecycle` feature has been added to the `azurerm_virtual_network` and `azurerm_subnet` resources for the following parameters that are not yet programmed in the module:
  - `azurerm_virtual_network`: `bgp_community` and `vm_protection_enabled`.
  - `azurerm_subnet`: `delegation`, `enforce_private_link_endpoint_network_policies`, `enforce_private_link_service_network_policies`, `service_endpoints` and `service_endpoint_policy_ids`.

## 1.1.1 (December 19, 2020)

BUG FIXES:

- **Output `dns_servers`:** The wrong parameter output.
- **Output `tags`:** The wrong parameter output.

## 1.1.0 (November 05, 2020)

FEATURES:

- **New Parameter:** `ddos_protection_plan_id`

## 1.0.0 (November 03, 2020)

FEATURES:

- **New Parameter:** `name`
- **New Parameter:** `resource_group_name`
- **New Parameter:** `location`
- **New Parameter:** `address_space`
- **New Parameter:** `dns_servers`
- **New Parameter:** `subnets`
- **New Parameter:** `subnets.name`
- **New Parameter:** `subnets.address_prefix`
- **New Parameter:** `tags`
