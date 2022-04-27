resource "cloudflare_argo" "hideout_argo" {
  zone_id        = var.CLOUDFLARE_ZONE_ID
  tiered_caching = "on"
  smart_routing  = "off" # costs $5 per month minimum
}
