---
name: write-tests
description: Use when creating or extending tests/testing.tftest.hcl for the Terraform module. Triggers on requests like "add tests", "write test asserts", "create the test file", "add test coverage for this variable".
---

# Skill: write-tests

Creates or extends `tests/testing.tftest.hcl` in the active module following the project's established patterns.

## When to use this skill

- When adding a new variable or sub-resource to the module: corresponding asserts must be added.
- When creating the test file from scratch for a new module.
- When reviewing existing test coverage and adding missing cases.

## Before you start

Read the module's `AGENTS.md` to understand:

- The managed resources and their local names.
- The available variables and their types.
- Module-specific details (workspace_id with special format requirements, test environment prerequisites, etc.).

If the module manages resources with name constraints (e.g. alphanumeric only, max 24 chars), use `substr(replace(run.setup.workspace_id, "-", ""), 0, N)` for `name`.

## Test file structure

```hcl
provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

variables {
  # Shared variables between runs that are not identity variables
  # (location, tags, and all module content variables)
  location = run.setup.resource_group_location
  tags     = run.setup.resource_group_tags
  # ... remaining variables with representative test values
}

run "plan" {
  command = plan

  variables {
    # Only identity variables that reference the test environment
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
  }

  # Plan asserts here
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
  }

  # Apply asserts here
}
```

## `tests/environment` module

The environment module always has this minimal structure:

```hcl
# tests/environment/locals.tf
locals {
  workspace_id = uuid()
}

# tests/environment/main.tf
resource "azurerm_resource_group" "rg" {
  name     = local.workspace_id
  location = "Spain Central"
}

# tests/environment/outputs.tf
output "workspace_id"            { value = local.workspace_id }
output "resource_group_id"       { value = azurerm_resource_group.rg.id }
output "resource_group_name"     { value = azurerm_resource_group.rg.name }
output "resource_group_location" { value = azurerm_resource_group.rg.location }
output "resource_group_tags"     { value = azurerm_resource_group.rg.tags }
```

If the module requires additional prerequisites (e.g. an Application Security Group, a Key Vault, an existing VNet), add them to `tests/environment/main.tf` and expose the needed outputs.

## `plan` run asserts

The goal of `plan` is to verify that each configured attribute reaches the resource unchanged by the module. Cover **all** attributes of all variables.

### Pattern — scalar passthrough

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>.<attribute> == var.<variable>
  error_message = "The <resource_short> <attribute> input variable is being modified."
}
```

### Pattern — module default value (not sourced from var)

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>.<attribute> == "<expected_default>"
  error_message = "The <resource_short> <attribute> input variable is being modified."
}
```

### Pattern — null attribute when optional variable is not passed

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>.<attribute> == null
  error_message = "The <resource_short> <attribute> input variable is being modified."
}
```

### Pattern — `for_each` sub-resource by name

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>["<key>"].<attribute> == ({ for s in var.<list_var> : s.name => s })["<key>"].<attribute>
  error_message = "The <key> <attribute> input variable is being modified."
}
```

### Pattern — `list` attribute (requires `tolist()`)

```hcl
assert {
  condition     = tolist(azurerm_<resource>.<local_name>.<attribute>) == var.<variable>
  error_message = "The <resource_short> <attribute> input variable is being modified."
}
```

### Pattern — `set` attribute (requires `toset()`)

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>["<key>"].<attribute> == toset(["value1", "value2"])
  error_message = "The <key> <attribute> input variable is being modified."
}
```

### Pattern — optional dynamic block (index `[0]`)

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>.<block>[0].<attribute> == var.<variable>
  error_message = "The <resource_short> <attribute> input variable is being modified."
}
```

### Pattern — nested sub-blocks inside `for_each` (re-keying)

```hcl
assert {
  condition     = ({ for item in azurerm_<resource>.<local_name>["<key>"].<nested_block> : item.<key_attr> => item })[<key_value>].<attribute> == var.<variable>[0].<nested>.<attribute>
  error_message = "The <key> <nested_attr> input variable is being modified."
}
```

### Error message format

Always: `"The <resource_short> <attribute> input variable is being modified."`

Real examples from the virtual-network module:

- `"The virtual network name input variable is being modified."`
- `"The subnet address_prefixes input variable is being modified."`
- `"The subnet delegation input variable is being modified."`

## `apply` run asserts

The goal of `apply` is to verify: deployed resource IDs in the correct format and module outputs.

### Pattern — primary resource ID

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>.id == "${run.setup.resource_group_id}/providers/Microsoft.<Namespace>/<ResourceType>/${run.setup.workspace_id}"
  error_message = "The <Resource> ID is not as expected."
}
```

### Pattern — `for_each` sub-resource ID

```hcl
assert {
  condition     = azurerm_<resource>.<local_name>["<key>"].id == "${run.setup.resource_group_id}/providers/Microsoft.<Namespace>/<ResourceType>/${run.setup.workspace_id}/<SubType>/<key>"
  error_message = "The <key> ID is not as expected."
}
```

### Pattern — module output verification

```hcl
assert {
  condition     = output.id == azurerm_<resource>.<local_name>.id
  error_message = "The <Resource> ID output is not as expected."
}

assert {
  condition     = output.<name> == azurerm_<resource>.<local_name>.<name>
  error_message = "The <Resource> <name> output is not as expected."
}

# For collection outputs (maps), verify the length:
assert {
  condition     = length(output.<collection>) == length(azurerm_<resource>.<local_name>)
  error_message = "The <Resource> <collection> output is not as expected."
}
```

## Terraform Registry MCP usage

Before writing `apply` asserts, consult the Terraform Registry MCP to confirm the exact resource ID format in Azure:

```text
terraform-registry: get resource schema for azurerm_<resource>
```

Look for the `id` attribute in the schema — it usually includes a description with the ARM ID format. This avoids interpolation errors in apply asserts.

## Checklist before finishing

- [ ] Every module variable has at least one assert in `plan`
- [ ] `for_each` sub-resources have asserts for each field of the variable, using at least 2 distinct keys
- [ ] `list` attributes use `tolist()`, `set` attributes use `toset()`
- [ ] Optional dynamic blocks have one case with the variable present and one with `null` (if applicable)
- [ ] The `apply` run verifies the primary resource ID and main sub-resource IDs
- [ ] The `apply` run verifies all module outputs
- [ ] Every assert message follows the format: `"The <resource_short> <attribute> input variable is being modified."`
