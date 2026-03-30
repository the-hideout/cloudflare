# The current Cloudflare token cannot read /argo/smart_routing, so this setting
# cannot be imported or planned cleanly via Terraform v5 yet.

resource "cloudflare_argo_tiered_caching" "hideout_argo" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  value   = "on"
}
