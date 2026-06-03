variables {
  CLOUDFLARE_TOKEN = "test-token"
}

mock_provider "cloudflare" {}

override_resource {
  target = cloudflare_dns_record.bot0
}

override_resource {
  target = cloudflare_dns_record.bot1
}

override_resource {
  target = cloudflare_dns_record.bot2
}

override_resource {
  target = cloudflare_dns_record.bot3
}

override_resource {
  target = cloudflare_dns_record.bot4
}

override_resource {
  target = cloudflare_dns_record.mx_route1
}

override_resource {
  target = cloudflare_dns_record.mx_route2
}

override_resource {
  target = cloudflare_dns_record.mx_route3
}

override_resource {
  target = cloudflare_dns_record.dkim_cf2024_1
}

override_resource {
  target = cloudflare_dns_record.railway_verify_socket
}

override_resource {
  target = cloudflare_dns_record.google_site_verification_primary
}

override_resource {
  target = cloudflare_dns_record.google_site_verification_secondary
}

override_resource {
  target = cloudflare_dns_record.spf
}

override_resource {
  target = cloudflare_dns_record.google_site_verification_tertiary
}

override_resource {
  target = cloudflare_ruleset.config_settings
}

override_resource {
  target = cloudflare_ruleset.custom_errors
}

override_resource {
  target = cloudflare_workers_kv_namespace.data_cache_dev
}

override_resource {
  target = cloudflare_workers_kv_namespace.data_cache
}

override_resource {
  target = cloudflare_workers_kv_namespace.stash_data
}

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
        cloudflare_dns_record.bot0,
        cloudflare_dns_record.bot1,
        cloudflare_dns_record.bot2,
        cloudflare_dns_record.bot3,
        cloudflare_dns_record.bot4,
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
    condition = alltrue([
      for record in [
        cloudflare_dns_record.mx_route1,
        cloudflare_dns_record.mx_route2,
        cloudflare_dns_record.mx_route3,
        cloudflare_dns_record.dkim_cf2024_1,
        cloudflare_dns_record.railway_verify_socket,
        cloudflare_dns_record.google_site_verification_primary,
        cloudflare_dns_record.google_site_verification_secondary,
        cloudflare_dns_record.spf,
        cloudflare_dns_record.google_site_verification_tertiary,
      ] : !record.proxied && record.zone_id == var.CLOUDFLARE_ZONE_ID
    ])
    error_message = "Managed mail and verification records must remain DNS-only records in the target zone."
  }

  assert {
    condition = alltrue([
      for namespace in [
        cloudflare_workers_kv_namespace.data_cache_dev,
        cloudflare_workers_kv_namespace.data_cache,
        cloudflare_workers_kv_namespace.stash_data,
      ] : namespace.account_id == var.CLOUDFLARE_ACCOUNT_ID
    ])
    error_message = "Managed KV namespace shells must stay pinned to The Hideout account."
  }

  assert {
    condition = (
      contains([for rule in cloudflare_ruleset.redirect_rules.rules : rule.ref], "www_redirect") &&
      contains([for rule in cloudflare_ruleset.cache_rules.rules : rule.ref], "cache_service") &&
      contains([for rule in cloudflare_ruleset.cache_rules.rules : rule.ref], "data_json") &&
      contains([for rule in cloudflare_ruleset.config_settings.rules : rule.ref], "strict_ssl_cache_service") &&
      cloudflare_ruleset.config_settings.phase == "http_config_settings" &&
      cloudflare_ruleset.custom_errors.phase == "http_custom_errors"
    )
    error_message = "Legacy Page Rule behavior must stay represented by native Cloudflare Rulesets."
  }

  assert {
    condition = alltrue([
      for refs in [
        [for rule in cloudflare_ruleset.api_rate_limit.rules : rule.ref],
        [for rule in cloudflare_ruleset.cache_rules.rules : rule.ref],
        [for rule in cloudflare_ruleset.redirect_rules.rules : rule.ref],
        [for rule in cloudflare_ruleset.config_settings.rules : rule.ref],
        [for rule in cloudflare_ruleset.custom_errors.rules : rule.ref],
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
