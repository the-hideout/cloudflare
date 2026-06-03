resource "cloudflare_ruleset" "config_settings" {
  kind    = "zone"
  name    = "default"
  phase   = "http_config_settings"
  zone_id = var.CLOUDFLARE_ZONE_ID

  rules = [
    {
      action = "set_config"
      action_parameters = {
        sxg = true
      }
      description = "tarkov.dev - configuration"
      enabled     = false
      expression  = "(http.host eq \"tarkov.dev\")"
      ref         = "cac9df6c991d49d693cc4d2519f8f3ee"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "full"
      }
      description = "socket.tarkov.dev SSL/TLS set to Full"
      enabled     = false
      expression  = "(http.host eq \"socket.tarkov.dev\")"
      ref         = "b3dc812aec6940f8b20d24960c908227"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "strict"
      }
      description = "Strict SSL for cache service"
      enabled     = true
      expression  = "(http.host eq \"cache.tarkov.dev\")"
      ref         = "strict_ssl_cache_service"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "strict"
      }
      description = "Strict SSL for status service"
      enabled     = true
      expression  = "(http.host eq \"status.tarkov.dev\")"
      ref         = "strict_ssl_status_service"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "strict"
      }
      description = "Strict SSL for manager service"
      enabled     = true
      expression  = "(http.host eq \"manager.tarkov.dev\")"
      ref         = "strict_ssl_manager_service"
    },
    {
      action = "set_config"
      action_parameters = {
        ssl = "strict"
      }
      description = "Strict SSL for socket service"
      enabled     = true
      expression  = "(http.host eq \"socket.tarkov.dev\")"
      ref         = "strict_ssl_socket_service"
    },
  ]
}
