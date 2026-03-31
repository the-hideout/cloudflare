resource "cloudflare_ruleset" "firewall_managed_api" {
  kind    = "zone"
  name    = "zone"
  phase   = "http_request_firewall_managed"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "execute"
      action_parameters = {
        id = "efb7b8c949ac4650a09736fc376e9aee"
        overrides = {
          rules = [
            {
              enabled = true
              id      = "9014439f4a0b4fbfa5412d8cad8ba4bc"
            },
          ]
        }
        version = "latest"
      }
      description = "zone"
      enabled     = true
      expression  = "(http.host eq \"api.tarkov.dev\")"
      ref         = "c0fe04afedc74a1fa06006f5ef7c2103"
    },
  ]
}
