resource "cloudflare_page_rule" "cache_service" {
  priority = 1
  status   = "active"
  target   = "cache.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    cache_level = "cache_everything"
    ssl         = "strict"
  }
}
