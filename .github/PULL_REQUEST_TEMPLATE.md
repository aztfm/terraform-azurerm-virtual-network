<!-- markdownlint-disable MD009 MD034 -->
## Description

<!-- Describe what this PR implements and why. -->

## New or affected parameter(s) / configuration(s)

<!-- List the new or modified variables. Example: `blob_properties` / `blob_properties.versioning_enabled` -->

## Changes included

- [ ] `variables.tf` — 
- [ ] `main.tf` — 
- [ ] `outputs.tf` — 
- [ ] `CHANGELOG.md` — entry added under the correct section
- [ ] `tests/testing.tftest.hcl` — assert block added

## Potential terraform configuration

```hcl
module "example" {
  source              = "aztfm/example/azurerm"
  version             = ">=1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = azurerm_resource_group.rg.tags
  # new parameter here
}
```

## References

- https://registry.terraform.io/providers/hashicorp/azurerm/...
- https://github.com/hashicorp/terraform-provider-azurerm/...
- https://learn.microsoft.com/en-us/azure/...
