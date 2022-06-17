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

# cloudflare_page_rule.status_services:
resource "cloudflare_page_rule" "status_services" {
    priority = 2
    status   = "active"
    target   = "status.tarkov.dev/*"
    zone_id  = var.CLOUDFLARE_ZONE_ID

    actions {
        browser_cache_ttl   = "120"
        ssl                 = "strict"
    }
}
