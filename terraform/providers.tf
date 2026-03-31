terraform {
  backend "remote" {
    organization = "the-hideout"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.17.0"
    }
  }
  required_version = "1.14.8"
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_TOKEN
}
