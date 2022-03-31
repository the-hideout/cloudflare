resource "cloudflare_zone" "tarkov_dev" {
  plan = "free"
  type = "full"
  zone = "tarkov.dev"
}