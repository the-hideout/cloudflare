resource "cloudflare_argo" "hideout_argo" {
  zone_id        = var.CLOUDFLARE_ZONE_ID
  tiered_caching = "on"
}
