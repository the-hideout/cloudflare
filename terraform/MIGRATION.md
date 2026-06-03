# Cloudflare Terraform State Migration

This repo uses Cloudflare Terraform provider v5-compatible HCL. State migration
work must be authenticated against Terraform Cloud and Cloudflare before the
final plan can be expected to be a no-op.

## Prerequisites

1. Install the Terraform version in `../.terraform-version`.
1. Authenticate Terraform Cloud for `app.terraform.io`.
1. Export `TF_VAR_CLOUDFLARE_TOKEN` from a token file or local secret manager.
   Do not print token values into terminal logs.

## Remote State Safety

1. Run `terraform state pull > ../.terraform-state-backups/backup-$(date +%Y%m%d-%H%M%S).tfstate`.
1. Do not run `terraform apply` as part of the migration.
1. Use `terraform plan` after each migration chunk.

## Current Migration Chunks

1. Import public DNS records and safe zone ruleset entrypoints into Terraform
   state.
1. Replace legacy Page Rules with native Redirect, Cache, and Configuration
   Rules. Once the native rules are live, the old Page Rules can be deleted by
   Terraform.
1. Keep Pages projects, Worker scripts/bindings, KV contents, and sensitive
   security policy outside this public repository unless a future review marks a
   specific resource safe to publish.

## Acceptance Bar

- No planned destroys or replacements for the zone, DNS records, or existing
  rulesets other than the intentional deletion of legacy Page Rules after their
  native equivalents are in place.
- A fully clean `.noop` plan after imports and Page Rule replacement have been
  applied.
