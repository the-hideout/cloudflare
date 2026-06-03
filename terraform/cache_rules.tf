resource "cloudflare_ruleset" "cache_rules" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_cache_settings"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 31536000
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 31536000
          mode    = "override_origin"
        }
      }
      description = "favicon"
      enabled     = true
      expression  = "(http.request.uri.path contains \"/favicon\")"
      ref         = "9c49b66c3e814dbfa6281cb03cb5ffff"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 345600
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 31536000
          mode    = "override_origin"
        }
      }
      description = "logo"
      enabled     = true
      expression  = "(http.request.uri.path contains \"tarkov-dev-logo\")"
      ref         = "eaa54486c6c74c8b83c04b0694e861e2"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 28800
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 16070400
          mode    = "override_origin"
        }
      }
      description = "fonts"
      enabled     = true
      expression  = "(http.request.uri.path contains \"/fonts/\")"
      ref         = "a0d4586d52c14dfc832c5fd90263a131"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 345600
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 604800
          mode    = "override_origin"
        }
      }
      description = "jpg or png images on all domains"
      enabled     = true
      expression  = "(ends_with(http.request.uri.path, \".jpg\")) or (ends_with(http.request.uri.path, \".png\"))"
      ref         = "2e7ab840d50147fba0a5f2ae6e08c136"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 604800
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 16070400
          mode    = "override_origin"
        }
      }
      description = "tarkov.dev images dir"
      enabled     = true
      expression  = "(http.host eq \"tarkov.dev\" and http.request.uri.path contains \"/images/\")"
      ref         = "52f2a779941244c387da27ca37ae4e3c"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 604800
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 2678400
          mode    = "override_origin"
        }
      }
      description = "assets domain caching"
      enabled     = true
      expression  = "(http.host eq \"assets.tarkov.dev\")"
      ref         = "e33636211eac48a79e684cd75f1e0425"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 86400
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 2678400
          mode    = "override_origin"
        }
      }
      description = "players domain caching"
      enabled     = true
      expression  = "(http.host eq \"players.tarkov.dev\")"
      ref         = "ee8bbe239ef643978022b0b3ff51dea7"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        cache = true
        cache_key = {
          custom_key = {
            query_string = {
              exclude = {
                all = true
              }
            }
          }
        }
        edge_ttl = {
          default = 2678400
          mode    = "override_origin"
        }
      }
      description = "JSON API"
      enabled     = true
      expression  = "(http.host in {\"json-dev.tarkov.dev\" \"json.tarkov.dev\"})"
      ref         = "41bc28aa7bd14f0fae4ec79482aec843"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        cache = true
      }
      description = "cache service"
      enabled     = true
      expression  = "(http.host eq \"cache.tarkov.dev\")"
      ref         = "cache_service"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 120
          mode    = "override_origin"
        }
      }
      description = "status service browser cache"
      enabled     = true
      expression  = "(http.host eq \"status.tarkov.dev\")"
      ref         = "status_services"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        cache = true
      }
      description = "status custom cache"
      enabled     = true
      expression  = "(http.host eq \"status.tarkov.dev\" and http.request.uri.path eq \"/api/status-page/heartbeat/api\")"
      ref         = "status_custom_cache"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 86400
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 86400
          mode    = "override_origin"
        }
      }
      description = "tarkov.dev data json"
      enabled     = true
      expression  = "(http.host eq \"tarkov.dev\" and starts_with(http.request.uri.path, \"/data/\") and ends_with(http.request.uri.path, \".json\"))"
      ref         = "data_json"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 31536000
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 2419200
          mode    = "override_origin"
        }
      }
      description = "tarkov.dev fonts"
      enabled     = true
      expression  = "(http.host eq \"tarkov.dev\" and http.request.uri.path contains \"/fonts/\")"
      ref         = "fonts_page_rule"
    },
    {
      action = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 31536000
          mode    = "override_origin"
        }
        cache = true
        edge_ttl = {
          default = 2419200
          mode    = "override_origin"
        }
      }
      description = "tarkov.dev images"
      enabled     = true
      expression  = "(http.host eq \"tarkov.dev\" and http.request.uri.path contains \"/images/\")"
      ref         = "images_page_rule"
    },
  ]
}
