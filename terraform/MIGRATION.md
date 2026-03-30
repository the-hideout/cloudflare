# Cloudflare Provider v5 State Migration

This repo now contains the Terraform v5-compatible HCL, but the remote backend
state still needs authenticated migration work before the final plan can be
expected to be a no-op.

## Prerequisites

1. Install Terraform `1.14.7` via `tfenv`.
1. Run `terraform login` for `app.terraform.io`.
1. Make sure `terraform/terraform.auto.tfvars.json` exists locally with
   `CLOUDFLARE_TOKEN`.

## Remote State Safety

1. Run `terraform state pull > backup-$(date +%Y%m%d-%H%M%S).tfstate`.
1. Do not run `terraform apply` as part of the migration.
1. Use `terraform plan` after each migration chunk.

## Required Migration Chunks

1. Bridge rulesets through provider `4.52.5`.
   Update the provider to `4.52.5`, re-import the existing rulesets, and confirm
   the remote plan does not contain destructive drift before moving to v5.
1. Import split zone settings.
   Remove `cloudflare_zone_settings_override.tarkov_dev` from state, then import
   the generated `cloudflare_zone_setting.settings[...]` instances.
1. Import the live `http_ratelimit` ruleset.
   Replace the old `cloudflare_rate_limit` state with
   `cloudflare_ruleset.api_rate_limit`.
1. Import `cloudflare_argo_tiered_caching.hideout_argo` if the provider accepts
   the resource import; otherwise expect one additive create in plan output.

## Acceptance Bar

- No planned destroys or replacements for the zone, DNS records, page rules, or
  existing rulesets.
- A fully clean `.noop` plan if every split resource can be imported.
- If `cloudflare_argo_tiered_caching` cannot be imported, the only acceptable
  remaining diff is that additive create.
