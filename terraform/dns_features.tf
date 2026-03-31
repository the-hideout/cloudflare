resource "cloudflare_zone_dnssec" "tarkov_dev" {
  status  = "disabled"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
