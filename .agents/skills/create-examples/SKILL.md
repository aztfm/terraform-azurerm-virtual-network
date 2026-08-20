---
name: create-examples
description: Use when creating a new example for the Terraform module in the examples/ directory. Triggers on requests like "add an example", "create an example for this feature", "generate example usage".
---

# Skill: create-examples

Creates a new example directory under `examples/` in the active module with a representative, functional `main.tf`.

## When to use this skill

- When adding a new feature to the module that warrants its own example.
- When creating the first example for a new module.
- When adding a specific use case not covered by existing examples.

## Before you start

1. Read the module's `AGENTS.md` to understand the managed resources, available variables, and their allowed values.
2. Review existing examples in `examples/` to avoid duplicating already-covered cases.
3. Use the Terraform Registry MCP to verify valid enum values, referenced resource IDs, and any naming constraints:

```text
terraform-registry: get resource azurerm_<resource> documentation
```

## Directory naming

The name must be descriptive of the use case, lowercase with hyphens:

```text
examples/
  <module-name>-basic/                           # Minimal case (required vars only)
  <module-name>-with-<feature>/                  # Case with a specific optional feature
  <module-name>-with-<feature1>-and-<feature2>/  # Combined case
```

Real examples from this project:

- `virtual-network-with-multiple-subnets/`
- `virtual-network-with-ddos-protection-plan/`

## Directory structure

Each example contains a **single file** `main.tf`:

```text
examples/
  <example-name>/
    main.tf
```

Do not create `variables.tf`, `outputs.tf`, or `versions.tf` in examples. The example is self-contained in `main.tf`.

## `main.tf` structure

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "<descriptive-rg-name>"
  location = "Spain Central"
}

module "<module_snake_name>" {
  source              = "aztfm/<module-slug>/azurerm"
  version             = ">= <current_major_version>.0.0"
  name                = "<descriptive-resource-name>"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  # ... remaining module variables
}
```

### Writing rules

1. **`resource_group_name` and `location` always reference the resource group**, never hardcoded directly in the module.
2. **Values are illustrative but valid** — they must pass Terraform validation without errors.
3. **`source` uses the public registry** `aztfm/<module-slug>/azurerm`, never a local path.
4. **`version` uses `>= X.0.0`** where `X` is the current major version of the module (read `CHANGELOG.md` to determine it).
5. **Resource names are descriptive**, not `"example"` or `"test"`. Use the real name of the use case (e.g. `"virtual-network"`, `"key-vault-with-rbac"`).
6. **Only include variables relevant to the use case** of the example. Do not include all optional variables if they don't add value to the example.
7. **List-of-objects values** (subnets, rules, etc.) are written with expanded objects, one per line:

```hcl
subnets = [
  {
    name             = "subnet-app"
    address_prefixes = ["10.0.1.0/24"]
    delegation       = "Microsoft.Web/serverFarms"
  },
  {
    name              = "subnet-data"
    address_prefixes  = ["10.0.2.0/24"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
  }
]
```

1. If the example requires resources external to the module (e.g. a Public IP for an Application Gateway, a Key Vault for certificates), declare those resources before the `module` block.

## Terraform Registry MCP usage

Before writing the example, consult:

- The primary resource schema to confirm valid enum values for attributes (e.g. `account_kind`, `sku_name`, delegation values).
- The resource documentation to understand which combinations of attributes are valid together.

This is especially important for modules with cross-variable validations (e.g. `account_kind = "FileStorage"` requires `account_tier = "Premium"`).

## Checklist before finishing

- [ ] The directory follows the `<module-name>-with-<feature>` naming convention
- [ ] `main.tf` starts with `azurerm_resource_group`
- [ ] `source` points to the public registry with the correct major version
- [ ] Values are valid and would pass `terraform validate`
- [ ] The example clearly illustrates the use case without unnecessary noise
- [ ] No additional files have been created outside of `main.tf`
