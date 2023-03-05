resource "cloudflare_ruleset" "redirect_rules" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_dynamic_redirect"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules {
    action      = "redirect"
    description = "Streamer domain graphql requests (dev)"
    enabled     = true
    expression  = "(starts_with(http.request.full_uri, \"https://dev-streamer.tarkov.dev/graphql\"))"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = false
      cookie_fields              = []
      disable_apps               = false
      disable_railgun            = false
      disable_zaraz              = false
      email_obfuscation          = false
      hotlink_protection         = false
      increment                  = 0
      mirage                     = false
      opportunistic_encryption   = false
      origin_error_page_passthru = false
      phases                     = []
      products                   = []
      request_fields             = []
      respect_strong_etags       = false
      response_fields            = []
      rocket_loader              = false
      rules                      = {}
      rulesets                   = []
      server_side_excludes       = false
      status_code                = 0
      sxg                        = false

      from_value {
        preserve_query_string = true
        status_code           = 308

        target_url {
          value = "https://dev-api.tarkov.dev/graphql"
        }
      }
    }
  }
  rules {
    action      = "redirect"
    description = "Streamer domain graphql requests"
    enabled     = true
    expression  = "(http.request.full_uri eq \"https://streamer.tarkov.dev/graphql\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = false
      cookie_fields              = []
      disable_apps               = false
      disable_railgun            = false
      disable_zaraz              = false
      email_obfuscation          = false
      hotlink_protection         = false
      increment                  = 0
      mirage                     = false
      opportunistic_encryption   = false
      origin_error_page_passthru = false
      phases                     = []
      products                   = []
      request_fields             = []
      respect_strong_etags       = false
      response_fields            = []
      rocket_loader              = false
      rules                      = {}
      rulesets                   = []
      server_side_excludes       = false
      status_code                = 0
      sxg                        = false

      from_value {
        preserve_query_string = true
        status_code           = 308

        target_url {
          value = "https://api.tarkov.dev/graphql"
        }
      }
    }
  }
  rules {
    action      = "redirect"
    description = "Playground root to /___graphql (dev)"
    enabled     = false
    expression  = "(http.request.full_uri eq \"https://dev-api.tarkov.dev/\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = false
      cookie_fields              = []
      disable_apps               = false
      disable_railgun            = false
      disable_zaraz              = false
      email_obfuscation          = false
      hotlink_protection         = false
      increment                  = 0
      mirage                     = false
      opportunistic_encryption   = false
      origin_error_page_passthru = false
      phases                     = []
      products                   = []
      request_fields             = []
      respect_strong_etags       = false
      response_fields            = []
      rocket_loader              = false
      rules                      = {}
      rulesets                   = []
      server_side_excludes       = false
      status_code                = 0
      sxg                        = false

      from_value {
        preserve_query_string = false
        status_code           = 301

        target_url {
          value = "https://dev-api.tarkov.dev/___graphql"
        }
      }
    }
  }
  rules {
    action      = "redirect"
    description = "Playground root to /___graphql"
    enabled     = false
    expression  = "(http.request.full_uri eq \"https://api.tarkov.dev/\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = false
      cookie_fields              = []
      disable_apps               = false
      disable_railgun            = false
      disable_zaraz              = false
      email_obfuscation          = false
      hotlink_protection         = false
      increment                  = 0
      mirage                     = false
      opportunistic_encryption   = false
      origin_error_page_passthru = false
      phases                     = []
      products                   = []
      request_fields             = []
      respect_strong_etags       = false
      response_fields            = []
      rocket_loader              = false
      rules                      = {}
      rulesets                   = []
      server_side_excludes       = false
      status_code                = 0
      sxg                        = false

      from_value {
        preserve_query_string = false
        status_code           = 301

        target_url {
          value = "https://api.tarkov.dev/___graphql"
        }
      }
    }
  }
}
