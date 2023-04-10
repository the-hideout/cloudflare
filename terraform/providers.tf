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
      version = "3.29.0"
    }
  }
  required_version = "1.4.4"
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_TOKEN
}
