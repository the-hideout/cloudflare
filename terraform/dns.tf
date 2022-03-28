resource "cloudflare_record" "api" {
    name        = "api"
    proxied     = true
    ttl         = 1
    type        = "CNAME"
    value       = "api.hideout-api.workers.dev"
    zone_id     = var.CLOUDFLARE_ZONE_ID
}