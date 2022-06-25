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

resource "cloudflare_page_rule" "status_services" {
  priority = 2
  status   = "active"
  target   = "status.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "120"
    ssl               = "strict"
  }
}

resource "cloudflare_page_rule" "manager_service" {
  priority = 3
  status   = "active"
  target   = "manager.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    ssl = "strict"
  }
}

resource "cloudflare_page_rule" "images" {
  priority = 6
  status   = "active"
  target   = "tarkov.dev/images/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "31536000"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2678400
  }
}

resource "cloudflare_page_rule" "fonts" {
  priority = 5
  status   = "active"
  target   = "tarkov.dev/fonts/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "31536000"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2678400
  }
}

resource "cloudflare_page_rule" "data_json" {
  priority = 4
  status   = "active"
  target   = "tarkov.dev/data/*.json"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "86400"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 86400
  }
}
