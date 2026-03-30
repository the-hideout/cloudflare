resource "cloudflare_ruleset" "redirect_rules" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_dynamic_redirect"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          preserve_query_string = true
          status_code           = 308
          target_url = {
            value = "https://dev-api.tarkov.dev/graphql"
          }
        }
      }
      description = "Streamer domain graphql requests (dev)"
      enabled     = true
      expression  = "(starts_with(http.request.full_uri, \"https://dev-streamer.tarkov.dev/graphql\"))"
      ref         = "9525c3e2b4f1428592ba8070306cbce8"
    },
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          preserve_query_string = true
          status_code           = 308
          target_url = {
            value = "https://api.tarkov.dev/graphql"
          }
        }
      }
      description = "Streamer domain graphql requests"
      enabled     = true
      expression  = "(starts_with(http.request.full_uri, \"https://streamer.tarkov.dev/graphql\"))"
      ref         = "e724c8da45da411aa54cf351b49bbbf2"
    },
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          preserve_query_string = false
          status_code           = 301
          target_url = {
            value = "https://dev-api.tarkov.dev/___graphql"
          }
        }
      }
      description = "Playground root to /___graphql (dev)"
      enabled     = false
      expression  = "(http.request.full_uri eq \"https://dev-api.tarkov.dev/\")"
      ref         = "582c2372ff22461d8a3e9e6cc8fe41a6"
    },
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          preserve_query_string = false
          status_code           = 301
          target_url = {
            value = "https://api.tarkov.dev/___graphql"
          }
        }
      }
      description = "Playground root to /___graphql"
      enabled     = false
      expression  = "(http.request.full_uri eq \"https://api.tarkov.dev/\")"
      ref         = "4c99e6c4e1894cb6b003b47bab83b7e6"
    },
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          preserve_query_string = true
          status_code           = 308
          target_url = {
            value = "https://manager.tarkov.dev/api/queue"
          }
        }
      }
      description = "Monitor API to Data Manager API"
      enabled     = true
      expression  = "(starts_with(http.request.full_uri, \"https://monitor.tarkov.dev/api\"))"
      ref         = "19a5d2d78bf54d0588ca127f290b3b06"
    },
  ]
}
