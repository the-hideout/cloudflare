resource "cloudflare_filter" "block_amazon_aes_got_attacker" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  description = "Block Amazon AES POST attacker using 'got'"
  expression = "(http.user_agent contains "got (https://github.com/sindresorhus/got)" and ip.geoip.asnum eq 14618 and http.request.uri.path eq "/graphql")"
}

resource "cloudflare_firewall_rule" "block_amazon_aes_got_attacker" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  description = "Block Amazon AES POST attacker using 'got'"
  filter_id = cloudflare_filter.block_amazon_aes_got_attacker.id
  action = "block"
}

resource "cloudflare_rate_limit" "tarkov_dev" {
  bypass_url_patterns = []
  description         = "API"
  disabled            = true
  period              = 10
  threshold           = 100
  zone_id             = var.CLOUDFLARE_ZONE_ID

  action {
    mode    = "ban"
    timeout = 3600
  }

  match {
    request {
      methods = [
        "_ALL_",
      ]
      schemes = [
        "_ALL_",
      ]
      url_pattern = "*api.tarkov.dev/*"
    }

    response {
      headers = [
        {
          "name"  = "Cf-Cache-Status"
          "op"    = "ne"
          "value" = "HIT"
        },
      ]
      origin_traffic = true
      statuses       = []
    }
  }
}
