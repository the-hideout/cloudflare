# Custom Setting Overrides for the tarkov.dev cloudflare zone
# Settings include:
# - Compression
# - Cache Level
# - Security Level
# - TTLs
# - TLS configuration
# - HSTS
# - Minify
# - etc...

# see all values here: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override

resource "cloudflare_zone_settings_override" "tarkov_dev" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  settings {
    # Toggles
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


    # String Values
    security_level  = "medium"
    cache_level     = "aggressive"
    min_tls_version = "1.0"
    ssl             = "flexible" # needed for S3 backend assets
    polish          = "lossy"

    # Integer Values
    browser_cache_ttl = 691200
    challenge_ttl     = 1800
    max_upload        = 100

    minify {
      css  = "on"
      js   = "on"
      html = "on"
    }

    security_header {
      enabled            = true
      preload            = true
      max_age            = 15552000 # 6 months
      include_subdomains = true
      nosniff            = true
    }
  }
}
