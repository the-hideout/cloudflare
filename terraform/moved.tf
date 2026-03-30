moved {
  from = cloudflare_record.root
  to   = cloudflare_dns_record.root
}

moved {
  from = cloudflare_record.www
  to   = cloudflare_dns_record.www
}

moved {
  from = cloudflare_record.api
  to   = cloudflare_dns_record.api
}

moved {
  from = cloudflare_record.dev_api
  to   = cloudflare_dns_record.dev_api
}

moved {
  from = cloudflare_record.assets
  to   = cloudflare_dns_record.assets
}

moved {
  from = cloudflare_record.manager
  to   = cloudflare_dns_record.manager
}

moved {
  from = cloudflare_record.status
  to   = cloudflare_dns_record.status
}

moved {
  from = cloudflare_record.socket
  to   = cloudflare_dns_record.socket
}

moved {
  from = cloudflare_record.cache
  to   = cloudflare_dns_record.cache
}

moved {
  from = cloudflare_record.dev_streamer
  to   = cloudflare_dns_record.dev_streamer
}

moved {
  from = cloudflare_record.streamer
  to   = cloudflare_dns_record.streamer
}

moved {
  from = cloudflare_record.players
  to   = cloudflare_dns_record.players
}

moved {
  from = cloudflare_argo.hideout_argo
  to   = cloudflare_argo_smart_routing.hideout_argo
}
