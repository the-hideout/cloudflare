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
