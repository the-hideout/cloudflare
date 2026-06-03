resource "cloudflare_ruleset" "custom_errors" {
  kind    = "zone"
  name    = "default"
  phase   = "http_custom_errors"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = []
}
