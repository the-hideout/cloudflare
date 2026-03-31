resource "cloudflare_tiered_cache" "tarkov_dev" {
  value   = "on"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
