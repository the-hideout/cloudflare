resource "cloudflare_page_rule" "www_redirect" {
  priority = 1
  status   = "active"
  target   = "www.tarkov.dev"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    forwarding_url {
      url = "https://tarkov.dev"
      status_code = 301
    }
  }
}

resource "cloudflare_page_rule" "cache_service" {
  priority = 2
  status   = "active"
  target   = "cache.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    cache_level = "cache_everything"
    ssl         = "strict"
  }
}

resource "cloudflare_page_rule" "status_services" {
  priority = 3
  status   = "active"
  target   = "status.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "120"
    ssl               = "strict"
  }
}

resource "cloudflare_page_rule" "status_custom_cache" {
  priority = 4
  status   = "active"
  target   = "status.tarkov.dev/api/status-page/heartbeat/api"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    cache_level = "cache_everything"
    ssl         = "strict"
  }
}

resource "cloudflare_page_rule" "manager_service" {
  priority = 5
  status   = "active"
  target   = "manager.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    ssl = "strict"
  }
}

resource "cloudflare_page_rule" "data_json" {
  priority = 6
  status   = "active"
  target   = "tarkov.dev/data/*.json"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "86400"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 86400
  }
}

resource "cloudflare_page_rule" "fonts" {
  priority = 7
  status   = "active"
  target   = "tarkov.dev/fonts/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "31536000"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2678400
  }
}

resource "cloudflare_page_rule" "images" {
  priority = 8
  status   = "active"
  target   = "tarkov.dev/images/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    browser_cache_ttl = "31536000"
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2678400
  }
}

resource "cloudflare_page_rule" "socket_service" {
  priority = 9
  status   = "active"
  target   = "socket.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID

  actions {
    ssl = "strict"
  }
}
