resource "cloudflare_ruleset" "security_response_headers" {
  description = "Sets security response headers"
  kind        = "zone"
  name        = "Security Response Headers"
  phase       = "http_response_headers_transform"
  zone_id     = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "rewrite"
      action_parameters = {
        headers = {
          "Content-Security-Policy" = {
            operation = "set"
            value     = "img-src 'self' https://assets.tarkov.dev https://avatars.githubusercontent.com data: https://images.weserv.nl https://imagemagic.tarkov.dev; frame-src 'self' https://discord.com https://challenges.cloudflare.com; style-src 'self' https://tarkov.dev https://discord.com 'unsafe-inline'; font-src 'self' https://tarkov.dev https://discord.com; form-action 'self'; script-src 'self' *.cloudflareinsights.com https://challenges.cloudflare.com wombatstats.com discord.com js-agent.newrelic.com bam.nr-data.net bam-cell.nr-data.net 'unsafe-inline'; object-src 'none'; base-uri 'self'; "
          }
          "X-Frame-Options" = {
            operation = "set"
            value     = "DENY"
          }
          "X-XSS-Protection" = {
            operation = "set"
            value     = "1; mode=block"
          }
        }
      }
      description = "Sets security response headers"
      enabled     = true
      expression  = "(not http.host contains \"api\" and not http.host contains \"manager\" and not http.host contains \"status\" and not http.host contains \"player\")"
      ref         = "4a2e30305b7d4694b5ff70d03a4a9769"
    },
    {
      action = "rewrite"
      action_parameters = {
        headers = {
          "Access-Control-Allow-Origin" = {
            operation = "set"
            value     = "*"
          }
        }
      }
      description = "Add CORS header to player API"
      enabled     = true
      expression  = "(http.host eq \"player.tarkov.dev\")"
      ref         = "495c1bf608f740c18639ecdfdea7eb13"
    },
    {
      action = "rewrite"
      action_parameters = {
        headers = {
          "Access-Control-Allow-Origin" = {
            operation = "set"
            value     = "*"
          }
        }
      }
      description = "Add CORS header to SVG maps"
      enabled     = true
      expression  = "(starts_with(http.request.full_uri, \"https://assets.tarkov.dev/maps/svg/\"))"
      ref         = "79325f409ac640aaa5ce3abb12e45236"
    },
  ]
}
