locals {
  zone_settings = {
    always_online            = "on"
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    brotli                   = "on"
    browser_check            = "on"
    http3                    = "on"
    ip_geolocation           = "on"
    ipv6                     = "on"
    opportunistic_encryption = "on"
    privacy_pass             = "on"
    rocket_loader            = "on"
    opportunistic_onion      = "on"
    websockets               = "on"
    zero_rtt                 = "on"
    webp                     = "on"

    security_level  = "medium"
    cache_level     = "aggressive"
    min_tls_version = "1.0"
    ssl             = "flexible"
    polish          = "lossy"

    browser_cache_ttl = 691200
    challenge_ttl     = 1800
    max_upload        = 100

    minify = {
      css  = "on"
      html = "on"
      js   = "on"
    }

    security_header = {
      strict_transport_security = {
        enabled            = true
        include_subdomains = true
        max_age            = 15552000
        nosniff            = true
        preload            = true
      }
    }
  }
}

resource "cloudflare_zone_setting" "settings" {
  for_each = local.zone_settings

  setting_id = each.key == "zero_rtt" ? "0rtt" : each.key
  value      = each.value
  zone_id    = var.CLOUDFLARE_ZONE_ID
}
