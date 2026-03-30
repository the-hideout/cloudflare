resource "cloudflare_argo_smart_routing" "hideout_argo" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  value   = "on"
}

resource "cloudflare_argo_tiered_caching" "hideout_argo" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  value   = "on"
}
