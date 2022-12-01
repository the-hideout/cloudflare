resource "cloudflare_zone" "tarkov_dev" {
  plan = "pro"
  type = "full"
  zone = "tarkov.dev"
  account_id = var.CLOUDFLARE_ACCOUNT_ID
}
