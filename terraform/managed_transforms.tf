resource "cloudflare_managed_transforms" "tarkov_dev" {
  zone_id = var.CLOUDFLARE_ZONE_ID

  # The v5 provider imports this resource with empty header sets even when the
  # live configuration is readable. Keep the desired values here, but suppress
  # the import-only churn so the repo can stay no-op without an apply.
  lifecycle {
    ignore_changes = [
      managed_request_headers,
      managed_response_headers,
    ]
  }

  managed_request_headers = [
    {
      enabled = false
      id      = "add_client_certificate_headers"
    },
    {
      enabled = false
      id      = "add_visitor_location_headers"
    },
    {
      enabled = false
      id      = "remove_visitor_ip_headers"
    },
    {
      enabled = false
      id      = "add_waf_credential_check_status_header"
    },
  ]

  managed_response_headers = [
    {
      enabled = false
      id      = "add_security_headers"
    },
    {
      enabled = false
      id      = "remove_x-powered-by_header"
    },
  ]
}
