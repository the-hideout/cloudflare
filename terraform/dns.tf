resource "cloudflare_dns_record" "root" {
  content = "tarkov-dev.pages.dev"
  name    = "tarkov.dev"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "www" {
  content = "tarkov-dev.pages.dev"
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "api" {
  content = "135.148.120.117"
  name    = "api"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dev_api" {
  content = "api-development.hideout-api.workers.dev"
  name    = "dev-api"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "assets" {
  content = "assets.tarkov.dev.s3-website-us-east-1.amazonaws.com"
  name    = "assets"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "manager" {
  content = "158.69.0.117"
  name    = "manager"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "status" {
  content = "96.230.1.240"
  name    = "status"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "socket" {
  content = "843dlh0u.up.railway.app"
  name    = "socket"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "cache" {
  content = "158.69.0.117"
  name    = "cache"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dev_streamer" {
  content = "api-development.hideout-api.workers.dev"
  name    = "dev-streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "streamer" {
  content = "api.hideout-api.workers.dev"
  name    = "streamer"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "players" {
  comment = "players.tarkov.dev S3 bucket"
  content = "players.tarkov.dev.s3-website-us-east-1.amazonaws.com"
  name    = "players"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dedapi" {
  content = "135.148.120.117"
  name    = "dedapi"
  proxied = true
  ttl     = 1
  type    = "A"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "json_dev" {
  content = "public.r2.dev"
  name    = "json-dev"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "json" {
  content = "public.r2.dev"
  name    = "json"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "mx_route1" {
  content  = "route1.mx.cloudflare.net"
  name     = "tarkov.dev"
  priority = 98
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "mx_route2" {
  content  = "route2.mx.cloudflare.net"
  name     = "tarkov.dev"
  priority = 34
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "mx_route3" {
  content  = "route3.mx.cloudflare.net"
  name     = "tarkov.dev"
  priority = 29
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "dkim_cf2024_1" {
  content = join(" ", [
    "\"v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiweykoi+o48IOGuP7GR3X0MOExCUDY/BCRHoWBnh3rChl7WhdyCxW3jgq1daEjPPqoi7sJvdg5hEQVsgVRQP4DcnQDVjGMbASQtrY4WmB1VebF+RPJB2ECPsEDTpeiI5ZyUAwJaVX7r6bznU67g7LvFq35yIo4sdlmtZGV+i0H4cpYH9+3JJ78k\"",
    "\"m4KXwaf9xUJCWF6nxeD+qG6Fyruw1Qlbds2r85U9dkNDVAS3gioCvELryh1TxKGiVTkg4wqHTyHfWsp7KD3WQHYJn0RyfJJu6YEmL77zonn7p2SRMvTMP3ZEXibnC9gz3nnhR6wcYL8Q7zXypKTMD58bTixDSJwIDAQAB\"",
  ])
  name    = "cf2024-1._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "railway_verify_socket" {
  content = "\"railway-verify=2134678b9d3fde0c6a1b7f03560597e57d1b94d3980501f7edcb6a4b76b1db03\""
  name    = "_railway-verify.socket"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "google_site_verification_primary" {
  content = "google-site-verification=ynS4YwsVQK-m34NgKErmdJKL0rIykucxyFJjM-In6RI"
  name    = "tarkov.dev"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "google_site_verification_secondary" {
  content = "google-site-verification=ociH_8-A27BdUGbgdFW3bFeSUKkYM-1WIzpc3Yrouj8"
  name    = "tarkov.dev"
  proxied = false
  ttl     = 3600
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "spf" {
  content = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  name    = "tarkov.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "google_site_verification_tertiary" {
  content = "google-site-verification=lWaLn42vZ_DRR_kVCouHYJeurjfCVa6cyJuSPuX0_yc"
  name    = "tarkov.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = var.CLOUDFLARE_ZONE_ID
}
