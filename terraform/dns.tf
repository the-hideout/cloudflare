resource "cloudflare_dns_record" "root" {
  content = "tarkov-dev.pages.dev"
  name    = "tarkov.dev"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "www" {
  content = "tarkov-dev.pages.dev"
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "api" {
  content = "135.148.120.117"
  name    = "api"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dev_api" {
  content = "api-development.hideout-api.workers.dev"
  name    = "dev-api"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "assets" {
  content = "assets.tarkov.dev.s3-website-us-east-1.amazonaws.com"
  name    = "assets"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "manager" {
  content = "158.69.0.117"
  name    = "manager"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "status" {
  content = "96.230.1.240"
  name    = "status"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "socket" {
  content = "843dlh0u.up.railway.app"
  name    = "socket"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "cache" {
  content = "158.69.0.117"
  name    = "cache"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dev_streamer" {
  content = "api-development.hideout-api.workers.dev"
  name    = "dev-streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "streamer" {
  content = "api.hideout-api.workers.dev"
  name    = "streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "players" {
  content = "players.tarkov.dev.s3-website-us-east-1.amazonaws.com"
  name    = "players"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
