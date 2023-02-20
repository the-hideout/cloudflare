resource "cloudflare_ruleset" "streamer_graphql_request" {
  zone_id     = var.CLOUDFLARE_ZONE_ID
  name        = "Streamer domain graphql requests"
  description = "Redirect graphql requests to streamer domain to main API"
  kind        = "zone"
  phase       = "http_request_static_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 308
        target_url {
          value = "https://api.tarkov.dev/graphql"
        }
        preserve_query_string = true
      }
    }
    expression  = "(starts_with(http.request.full_uri, \"https://streamer.tarkov.dev/graphql\"))"
    description = "Redirect graphql requests"
    enabled     = true
  }
}

resource "cloudflare_ruleset" "streamer_graphql_request_dev" {
  zone_id     = var.CLOUDFLARE_ZONE_ID
  name        = "Streamer domain graphql requests (dev)"
  description = "Redirect graphql requests to streamer domain to main API"
  kind        = "zone"
  phase       = "http_request_static_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 308
        target_url {
          value = "https://dev-api.tarkov.dev/graphql"
        }
        preserve_query_string = true
      }
    }
    expression  = "(starts_with(http.request.full_uri, \"https://dev-streamer.tarkov.dev/graphql\"))"
    description = "Redirect graphql requests to streamer domain to main API"
    enabled     = true
  }
}

resource "cloudflare_ruleset" "graphql_playground" {
  zone_id     = var.CLOUDFLARE_ZONE_ID
  name        = "Playground root to /___graphql"
  description = "Redirect root API requests to /___graphql"
  kind        = "zone"
  phase       = "http_request_static_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "https://api.tarkov.dev/___graphql"
        }
        preserve_query_string = false
      }
    }
    expression  = "(http.request.full_uri eq \"https://api.tarkov.dev/\")"
    description = "Redirect graphql requests"
    enabled     = false
  }
}

resource "cloudflare_ruleset" "graphql_playground" {
  zone_id     = var.CLOUDFLARE_ZONE_ID
  name        = "Playground root to /___graphql (dev)"
  description = "Redirect root API requests to /___graphql"
  kind        = "zone"
  phase       = "http_request_static_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "https://dev-api.tarkov.dev/___graphql"
        }
        preserve_query_string = false
      }
    }
    expression  = "(http.request.full_uri eq \"https://dev-api.tarkov.dev/\")"
    description = "Redirect graphql requests"
    enabled     = false
  }
}
