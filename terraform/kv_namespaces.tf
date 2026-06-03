resource "cloudflare_workers_kv_namespace" "data_cache_dev" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  title      = "DATA_CACHE_DEV"
}

resource "cloudflare_workers_kv_namespace" "data_cache" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  title      = "DATA_CACHE"
}

resource "cloudflare_workers_kv_namespace" "stash_data" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  title      = "STASH_DATA"
}
