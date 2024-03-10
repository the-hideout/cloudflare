resource "cloudflare_record" "root" {
  name    = "tarkov.dev"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tarkov-dev.pages.dev"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "www" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tarkov-dev.pages.dev"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "api" {
  name    = "api"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ecp.map.fastly.net"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "dev_api" {
  name    = "dev-api"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "ecp.map.fastly.net"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "assets" {
  name    = "assets"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "assets.thehideout.io.s3-website-us-east-1.amazonaws.com"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "manager" {
  name    = "manager"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "20.115.107.210"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "status" {
  name    = "status"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "20.228.137.173"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "socket" {
  name    = "socket"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tarkov-socket-server-production.up.railway.app"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "market" {
  name    = "market"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "209.151.146.50"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "cache" {
  name    = "cache"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tarkov-cache.azurewebsites.net"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "cache_azure_function_verification" {
  name    = "asuid.cache"
  ttl     = 1
  type    = "TXT"
  value   = "966A35FCB4A0FE1176E2320038F9EA960F6E2FE36A69ABDFC79A272FE4E2228F"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "dev_streamer" {
  name    = "dev-streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "api-development.hideout-api.workers.dev"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "streamer" {
  name    = "streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "api.hideout-api.workers.dev"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
