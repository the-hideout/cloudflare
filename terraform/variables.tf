variable "CLOUDFLARE_TOKEN" {
    description = "API token to access the Cloudflare API via the Terraform provider"
    type = string
    sensitive = true
}

variable "CLOUDFLARE_ZONE_ID" {
  description = "The zone_id for The-Hideout"
  type = string
  default = "a17204c79af55fcf05e4975f66e2490e"
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  description = "The account_id for The-Hideout"
  type = string
  default = "424ad63426a1ae47d559873f929eb9fc"
}
