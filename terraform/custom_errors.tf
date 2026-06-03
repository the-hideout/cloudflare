resource "cloudflare_ruleset" "custom_errors" {
  kind    = "zone"
  name    = "default"
  phase   = "http_custom_errors"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "serve_error"
      action_parameters = {
        content = jsonencode({
          error = "Not found"
        })
        content_type = "application/json"
      }
      description = "R2 API Custom 404"
      enabled     = true
      expression  = "(http.host in {\"api2.tarkov.dev\" \"json.tarkov.dev\" \"json-dev.tarkov.dev\"} and http.response.code eq 404)"
      ref         = "49043870ec454b6ea5b0aeffa463775d"
    },
  ]
}
