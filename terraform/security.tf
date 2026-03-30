# This replaces the deprecated cloudflare_rate_limit resource. Once Terraform
# Cloud auth is available, import the live http_ratelimit ruleset before
# expecting a clean no-op plan from the remote backend.
resource "cloudflare_ruleset" "api_rate_limit" {
  kind    = "zone"
  name    = "default"
  phase   = "http_ratelimit"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action      = "block"
      description = "Image API Limit"
      enabled     = true
      expression  = "(http.host eq \"imagemagic.tarkov.dev\")"
      ref         = "b20a06aa088d4e47ba98f2b0e6fc144a"
      ratelimit = {
        characteristics     = ["ip.src", "cf.colo.id"]
        mitigation_timeout  = 60
        period              = 10
        requests_per_period = 25
      }
    },
    {
      action      = "block"
      description = "GraphQL API Rate Limit"
      enabled     = true
      expression  = "(http.host eq \"api.tarkov.dev\")"
      ref         = "cda27d63e4554f078f83d3db7c47251e"
      ratelimit = {
        characteristics     = ["ip.src", "cf.colo.id"]
        mitigation_timeout  = 60
        period              = 10
        requests_per_period = 100
      }
    },
    {
      action      = "block"
      description = "API"
      enabled     = true
      expression  = "concat(http.host, http.request.uri.path) wildcard r\"*api.tarkov.dev/*\""
      ref         = "fe2759fc96c544a2a6f7de5b92913bc1"
      ratelimit = {
        characteristics     = ["cf.colo.id", "ip.src"]
        mitigation_timeout  = 3600
        period              = 10
        requests_per_period = 100
        requests_to_origin  = true
      }
    },
  ]
}
