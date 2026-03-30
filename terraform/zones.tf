resource "cloudflare_zone" "tarkov_dev" {
  account = {
    id = var.CLOUDFLARE_ACCOUNT_ID
  }
  name = "tarkov.dev"
  type = "full"
}
