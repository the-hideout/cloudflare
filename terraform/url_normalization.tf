resource "cloudflare_url_normalization_settings" "tarkov_dev" {
  scope   = "incoming"
  type    = "cloudflare"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
