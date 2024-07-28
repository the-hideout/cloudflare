resource "cloudflare_ruleset" "cache_rules" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_cache_settings"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules {
    action      = "set_cache_settings"
    description = "favicon"
    enabled     = true
    expression  = "(http.request.uri.path contains \"/favicon\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 31536000
        mode    = "override_origin"
      }

      edge_ttl {
        default = 31536000
        mode    = "override_origin"
      }
    }
  }
  rules {
    action      = "set_cache_settings"
    description = "logo"
    enabled     = true
    expression  = "(http.request.uri.path contains \"tarkov-dev-logo\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 345600
        mode    = "override_origin"
      }

      edge_ttl {
        default = 31536000
        mode    = "override_origin"
      }
    }
  }
  rules {
    action      = "set_cache_settings"
    description = "fonts"
    enabled     = true
    expression  = "(http.request.uri.path contains \"/fonts/\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 28800
        mode    = "override_origin"
      }

      edge_ttl {
        default = 16070400
        mode    = "override_origin"
      }
    }
  }
  rules {
    action      = "set_cache_settings"
    description = "jpg or png images on all domains"
    enabled     = true
    expression  = "(ends_with(http.request.uri.path, \".jpg\")) or (ends_with(http.request.uri.path, \".png\"))"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 345600
        mode    = "override_origin"
      }

      edge_ttl {
        default = 604800
        mode    = "override_origin"
      }

      cache_key {
        cache_by_device_type       = false
        cache_deception_armor      = false
        ignore_query_strings_order = false

        custom_key {

          query_string {
            exclude = [
              "*",
            ]
            include = []
          }
        }
      }
    }
  }
  rules {
    action      = "set_cache_settings"
    description = "tarkov.dev images dir"
    enabled     = true
    expression  = "(http.host eq \"tarkov.dev\" and http.request.uri.path contains \"/images/\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 604800
        mode    = "override_origin"
      }

      edge_ttl {
        default = 16070400
        mode    = "override_origin"
      }

      cache_key {
        cache_by_device_type       = false
        cache_deception_armor      = false
        ignore_query_strings_order = false

        custom_key {

          query_string {
            exclude = [
              "*",
            ]
            include = []
          }
        }
      }
    }
  }
  rules {
    action      = "set_cache_settings"
    description = "assets domain caching"
    enabled     = true
    expression  = "(http.host eq \"assets.tarkov.dev\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 604800
        mode    = "override_origin"
      }

      edge_ttl {
        default = 2678400
        mode    = "override_origin"
      }

      cache_key {
        cache_by_device_type       = false
        cache_deception_armor      = false
        ignore_query_strings_order = false

        custom_key {

          query_string {
            exclude = [
              "*",
            ]
            include = []
          }
        }
      }
    }
  }

  rules {
    action      = "set_cache_settings"
    description = "players domain caching"
    enabled     = true
    expression  = "(http.host eq \"players.tarkov.dev\")"

    action_parameters {
      automatic_https_rewrites   = false
      bic                        = false
      cache                      = true
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

      browser_ttl {
        default = 86400
        mode    = "override_origin"
      }

      edge_ttl {
        default = 86400
        mode    = "override_origin"
      }

      cache_key {
        cache_by_device_type       = false
        cache_deception_armor      = false
        ignore_query_strings_order = false

        custom_key {

          query_string {
            exclude = [
              "*",
            ]
            include = []
          }
        }
      }
    }
  }
}
