---
name: update-changelog
description: Use when updating or generating the CHANGELOG.md UNRELEASED section for the Terraform module. Triggers on requests like "update changelog", "add changelog entry", "document this change in the changelog".
---

# Skill: update-changelog

Generates or updates the `UNRELEASED` section of the active module's `CHANGELOG.md` following the project's established format.

## When to use this skill

When changes have been made to the module and need to be documented before creating a release: new variables, removed variables, default behavior changes, dependency updates, etc.

## Workflow

### 1. Analyze the changes made

Read the modified module files to identify what changed:

- `variables.tf` — variables added, removed, or modified
- `main.tf` — new resources, dynamic blocks, behaviors
- `outputs.tf` — outputs added or removed
- `locals.tf` — new entries in lookup maps (delegations, rule sets, etc.)
- `versions.tf` — changes to minimum Terraform or provider versions

If it's unclear what changed, use `git diff` to compare against the previous state.

### 2. Classify each change into its category

| Category | When to use |
|----------|-------------|
| `FEATURES` | New variable that adds functionality that did not exist before |
| `ENHANCEMENTS` | New options in an existing variable (e.g. a new allowed enum value), internal improvements with no interface impact |
| `BREAKING CHANGES` | Variable removal, type change, default value change, internal resource rename that breaks state, minimum Terraform or provider version bump |
| `DEPRECATIONS` | Variable removed in favor of a new one (advance notice before a BREAKING CHANGE) |
| `BUG FIXES` | Correction of incorrect behavior with no interface change |

### 3. Write entries using the correct format

File format:

```markdown
<!-- markdownlint-disable MD041 -->

## UNRELEASED

FEATURES:

* **New Parameter:** `<variable_name>` ([#N](link))
* **New Parameter:** `<parent>.<child_attribute>` ([#N](link))

ENHANCEMENTS:

* `<variable_name>`: added `<value>` as valid value ([#N](link))
* New options have been added to the `<variable_name>` parameter: `Value1`, `Value2` and `Value3`.
* dependencies: updating to `v<X.Y.Z>` minimum of `<provider>`.

BREAKING CHANGES:

* dependencies: updating to `v<X.Y.Z>` minimum of `terraform`.
* dependencies: updating to `v<X.Y.Z>` minimum of `hashicorp/azurerm` provider.
* The `<old_parameter>` parameter has been removed in favor of `<new_parameter>`.
* `<variable_name>` default changed from `<old>` to `<new>`.

DEPRECATIONS:

* The `<parameter>` parameter has been deprecated in favor of `<new_parameter>`.

BUG FIXES:

* **Output `<output_name>`:** <description of the corrected issue>.

---

## X.Y.Z (Month DD, YYYY)
...
```

### 4. Writing rules

- Omit empty sections entirely (do not write `FEATURES:` if there are no features).
- The `## UNRELEASED` block always goes at the top of the file, before the most recent version.
- If a `## UNRELEASED` block already exists, add new entries inside it without duplicating headings.
- Sub-parameter changes are referenced as `parent.child` (e.g. `subnets.delegation`).
- PR/issue links `([#N](link))` are optional if the number is unavailable; omit them in that case.
- New delegation or enum option entries are grouped into a single `ENHANCEMENTS` line with all new values separated by commas, with the last one preceded by `and`.

### 5. Preserve existing history

Do not modify any entries from previously published versions (`## X.Y.Z` blocks). Only add or modify the `## UNRELEASED` block.
