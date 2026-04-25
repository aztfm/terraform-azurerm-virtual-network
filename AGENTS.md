# terraform-azurerm-virtual-network

Terraform module for Azure Virtual Network. Wraps `azurerm_virtual_network` and `azurerm_subnet` together — they represent a single Azure networking concept.

## Terraform resources

| Resource | Local name | Role |
| -------- | ---------- | ---- |
| `azurerm_virtual_network` | `vnet` | Primary resource |
| `azurerm_subnet` | `subnets` | Repeatable — subnets, `for_each` by `name` |

## Module-specific conventions

- `locals.tf` contains `local.service_delegation_actions`: a lookup map of ~60 Azure service names to their required network actions. Use it to auto-populate `service_delegation.actions` — do not require users to provide actions manually.
- Subnet delegation `actions` come from `local.service_delegation_actions[delegation.name]` — not from user input.
- Features that affect both VNet and subnet behavior (e.g., new subnet-level integration that requires a VNet-level flag) must be implemented in both resources in the same PR.
- `subnets` uses `for_each = { for subnet in var.subnets : subnet.name => subnet }`.
- `azurerm_subnet.subnets` references `azurerm_virtual_network.vnet.name` and `azurerm_virtual_network.vnet.resource_group_name`.

## General conventions

See org-level `copilot-instructions.md` for all variable, main.tf, outputs, CHANGELOG, and test patterns.
