# Cloudflare rejects /url_normalization for scoped API tokens even when normal
# zone settings endpoints are authorized, so keep the live setting unmanaged.
removed {
  from = cloudflare_url_normalization_settings.tarkov_dev

  lifecycle {
    destroy = false
  }
}
