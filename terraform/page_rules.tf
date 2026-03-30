resource "cloudflare_page_rule" "www_redirect" {
  actions = {
    forwarding_url = {
      status_code = 301
      url         = "https://tarkov.dev"
    }
  }
  priority = 1
  status   = "active"
  target   = "www.tarkov.dev"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "cache_service" {
  actions = {
    cache_level = "cache_everything"
    ssl         = "strict"
  }
  priority = 2
  status   = "active"
  target   = "cache.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "status_services" {
  actions = {
    browser_cache_ttl = 120
    ssl               = "strict"
  }
  priority = 3
  status   = "active"
  target   = "status.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "status_custom_cache" {
  actions = {
    cache_level = "cache_everything"
    ssl         = "strict"
  }
  priority = 4
  status   = "active"
  target   = "status.tarkov.dev/api/status-page/heartbeat/api"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "manager_service" {
  actions = {
    ssl = "strict"
  }
  priority = 5
  status   = "active"
  target   = "manager.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "data_json" {
  actions = {
    browser_cache_ttl = 86400
    cache_level       = "cache_everything"
    edge_cache_ttl    = 86400
  }
  priority = 6
  status   = "active"
  target   = "tarkov.dev/data/*.json"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "fonts" {
  actions = {
    browser_cache_ttl = 31536000
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2419200
  }
  lifecycle {
    ignore_changes = [actions["edge_cache_ttl"]]
  }
  priority = 7
  status   = "active"
  target   = "tarkov.dev/fonts/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "images" {
  actions = {
    browser_cache_ttl = 31536000
    cache_level       = "cache_everything"
    edge_cache_ttl    = 2419200
  }
  lifecycle {
    ignore_changes = [actions["edge_cache_ttl"]]
  }
  priority = 8
  status   = "active"
  target   = "tarkov.dev/images/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_page_rule" "socket_service" {
  actions = {
    ssl = "strict"
  }
  priority = 9
  status   = "active"
  target   = "socket.tarkov.dev/*"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}
