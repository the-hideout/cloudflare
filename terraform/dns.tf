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
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "api.hideout-api.workers.dev"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "dev_api" {
  name    = "dev-api"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "api-development.hideout-api.workers.dev"
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
  proxied = false
  ttl     = 240
  type    = "A"
  value   = "20.115.107.210"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "status" {
  name    = "status"
  proxied = false
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
  value   = "hideout-socket-server.herokuapp.com"
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
    name        = "cache"
    proxied     = true
    ttl         = 1
    type        = "A"
    value       = "20.231.196.38"
    zone_id = var.CLOUDFLARE_ZONE_ID
}
