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
      version = "3.11.0"
    }
  }
  required_version = "1.1.7"
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_TOKEN
}
