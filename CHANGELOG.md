## 1.3.0 (August 11, 2021)

FEATURES:

* **New Parameter:** `subnets.enforce_private_link_service_network_policies`
* **New Parameter:** `subnets.enforce_private_link_endpoint_network_policies`
* **New Parameter:** `subnets.delegation`: The delegation of the services of `Microsoft.BareMetal/AzureVMware`, `Microsoft.BareMetal/CrayServers`, `Microsoft.Batch/batchAccounts`, `Microsoft.ContainerInstance/containerGroups`, `Microsoft.Databricks/workspaces`, `Microsoft.DBforPostgreSQL/serversv2`, `Microsoft.HardwareSecurityModules/dedicatedHSMs`, `Microsoft.Logic/integrationServiceEnvironments`, `Microsoft.Netapp/volumes`, `Microsoft.ServiceFabricMesh/networks`, `Microsoft.Sql/managedInstances`, `Microsoft.StreamAnalytics/streamingJobs`, `Microsoft.Web/hostingEnvironments` and `Microsoft.Web/serverFarms`.

BUG FIXES:

* The `lifecycle` property has been removed both because there are parameters that have been added to the module, and parameters that are not compatible with the minimum version of the module. 

## 1.2.0 (March 11, 2021)

FEATURES:

* **New Parameter:** `subnets.service_endpoints`

ENHANCEMENTS:

* The `lifecycle` feature has been added to the `azurerm_virtual_network` and `azurerm_subnet` resources for the following parameters that are not yet programmed in the module: 
  * `azurerm_virtual_network`: `bgp_community` and `vm_protection_enabled`.
  * `azurerm_subnet`: `delegation`, `enforce_private_link_endpoint_network_policies`, `enforce_private_link_service_network_policies`, `service_endpoints` and `service_endpoint_policy_ids`.

## 1.1.1 (December 19, 2020)

BUG FIXES:

* **Output `dns_servers`:** The wrong parameter output.
* **Output `tags`:** The wrong parameter output.

## 1.1.0 (November 05, 2020)

FEATURES:

* **New Parameter:** `ddos_protection_plan_id`

## 1.0.0 (November 03, 2020)

FEATURES:

* **New Parameter:** `name`
* **New Parameter:** `resource_group_name`
* **New Parameter:** `location`
* **New Parameter:** `address_space`
* **New Parameter:** `dns_servers`
* **New Parameter:** `subnets`
* **New Parameter:** `subnets.name`
* **New Parameter:** `subnets.address_prefix`
* **New Parameter:** `tags`
