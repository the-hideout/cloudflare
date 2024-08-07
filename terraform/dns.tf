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
  value   = "assets.tarkov.dev.s3-website-us-east-1.amazonaws.com"
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
  value   = "96.230.1.240"
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
  type    = "A"
  value   = "135.148.148.174"
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

resource "cloudflare_record" "players" {
  name    = "players"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "players.tarkov.dev.s3-website-us-east-1.amazonaws.com"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
