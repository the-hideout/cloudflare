variables {
  CLOUDFLARE_TOKEN = "test-token"
}

mock_provider "cloudflare" {}

run "static_configuration" {
  command = plan

  assert {
    condition = (
      cloudflare_zone.tarkov_dev.name == "tarkov.dev" &&
      cloudflare_zone.tarkov_dev.account.id == var.CLOUDFLARE_ACCOUNT_ID &&
      cloudflare_zone.tarkov_dev.type == "full"
    )
    error_message = "Zone identity must stay pinned to the tarkov.dev production zone."
  }

  assert {
    condition = alltrue([
      for record in [
        cloudflare_dns_record.root,
        cloudflare_dns_record.www,
        cloudflare_dns_record.api,
        cloudflare_dns_record.dev_api,
        cloudflare_dns_record.assets,
        cloudflare_dns_record.manager,
        cloudflare_dns_record.status,
        cloudflare_dns_record.socket,
        cloudflare_dns_record.cache,
        cloudflare_dns_record.dev_streamer,
        cloudflare_dns_record.streamer,
        cloudflare_dns_record.players,
        cloudflare_dns_record.dedapi,
        cloudflare_dns_record.fence,
        cloudflare_dns_record.imagemagic,
        cloudflare_dns_record.json_dev,
        cloudflare_dns_record.json,
        cloudflare_dns_record.player,
      ] : contains(["A", "CNAME"], record.type) &&
      record.proxied &&
      record.ttl == 1 &&
      record.zone_id == var.CLOUDFLARE_ZONE_ID
    ])
    error_message = "Managed DNS records must remain proxied A/CNAME records in the target zone."
  }

  assert {
    condition = length(distinct([
      for rule in [
        cloudflare_page_rule.www_redirect,
        cloudflare_page_rule.cache_service,
        cloudflare_page_rule.status_services,
        cloudflare_page_rule.status_custom_cache,
        cloudflare_page_rule.manager_service,
        cloudflare_page_rule.data_json,
        cloudflare_page_rule.fonts,
        cloudflare_page_rule.images,
        cloudflare_page_rule.socket_service,
      ] : rule.priority
    ])) == 9
    error_message = "Page rule priorities must remain unique."
  }

  assert {
    condition = alltrue([
      for refs in [
        [for rule in cloudflare_ruleset.api_rate_limit.rules : rule.ref],
        [for rule in cloudflare_ruleset.cache_rules.rules : rule.ref],
        [for rule in cloudflare_ruleset.redirect_rules.rules : rule.ref],
        [for rule in cloudflare_ruleset.security_response_headers.rules : rule.ref],
        [for rule in cloudflare_ruleset.firewall_managed_api.rules : rule.ref],
      ] : length(distinct(refs)) == length(refs)
    ])
    error_message = "Ruleset refs must stay unique within each ruleset to avoid churn."
  }

  assert {
    condition = (
      cloudflare_zone_dnssec.tarkov_dev.status == "disabled" &&
      cloudflare_url_normalization_settings.tarkov_dev.scope == "incoming" &&
      cloudflare_url_normalization_settings.tarkov_dev.type == "cloudflare" &&
      cloudflare_tiered_cache.tarkov_dev.value == "on" &&
      cloudflare_zone_setting.settings["ssl"].value == "flexible" &&
      cloudflare_zone_setting.settings["security_level"].value == "medium"
    )
    error_message = "Key zone, cache, and security settings must remain explicitly configured."
  }

  assert {
    condition = alltrue([
      for transform in cloudflare_managed_transforms.tarkov_dev.managed_request_headers : !transform.enabled
      ]) && alltrue([
      for transform in cloudflare_managed_transforms.tarkov_dev.managed_response_headers : !transform.enabled
    ])
    error_message = "Managed transforms must stay disabled unless we intentionally opt in."
  }
}
