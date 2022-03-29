resource "cloudflare_record" "api" {
    name        = "api"
    proxied     = true
    ttl         = 1
    type        = "CNAME"
    value       = "api.hideout-api.workers.dev"
    zone_id     = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "assets" {
    name        = "assets"
    proxied     = true
    ttl         = 1
    type        = "CNAME"
    value       = "assets.thehideout.io.s3-website-us-east-1.amazonaws.com"
    zone_id     = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "manager" {
    name        = "manager"
    proxied     = false
    ttl         = 60
    type        = "A"
    value       = "20.115.107.210"
    zone_id     = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_record" "status" {
    name        = "status"
    proxied     = false
    ttl         = 60
    type        = "A"
    value       = "20.228.137.173"
    zone_id     = var.CLOUDFLARE_ZONE_ID
}
