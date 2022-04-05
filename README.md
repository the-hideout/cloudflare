# cloudflare ☁️

[![ci](https://github.com/the-hideout/cloudflare/actions/workflows/ci.yml/badge.svg)](https://github.com/the-hideout/cloudflare/actions/workflows/ci.yml)

Public Infrastructure as Code (IaC) for The-Hideout's Cloudflare (CF) configuration - managed by Terraform!

## About 💡

This repository uses Terraform to manage the configration and state for all supported pieces of our Cloudflare infrastruce:

- [`Zones`](terraform/zones.tf)
- [`DNS`](terraform/dns.tf)
- [`Zone Settings`](terraform/zone_settings.tf)
- [`Rate Limits + Some Security Settings`](terraform/security.tf)
- More to come!

## Usage 🔨


The best and suggested way to make changes to our Cloudflare configurations is through pull requests. You *can* make changes by running Terraform locally but this requires the proper setup, and credentials. These steps will be noted below but are generally reserved for core contributors to the project

### Deployment 🚀

To deploy a change to our CF infrastructure, simply do the following:

1. Draft your changes in your favorite IDE
1. Open a pull request with your changes
1. Ensure CI is passing and review the Terraform Plan comment on your pull request
1. Obtain a review confirming your changes
1. Branch deploy your change to production via a comment on your pull request - [branch deploy example](https://github.com/the-hideout/cloudflare/pull/11)

   > Simply comment `.deploy` on your PR to deploy your changes. If anything goes wrong, or you need to rollback, comment `.deploy main` to re-deploy the `main` branch to production - Here is another example showing how PR approvals and rollbacks work: [example](https://github.com/the-hideout/cloudflare/pull/19)

1. Wait at least 5 minutes to ensure your changes are working as expected
1. Merge! Upon merging, your changes will be automatically deployed to production (again) ✨

> Note: Since we are using branch deploys your merge will often show a "no changes" in the Terraform apply (in the GitHub Actions job). This is expected because if you branch deployed, your changes are already live so there is nothing Terraform needs to do. Hooray!

### Local Development 🧱

> Note: This section is entirely optional and really only used by core contributors. Opening a pull request with your changes will execute a Terraform Plan and suffice for 99% of use cases

To develop with this repository locally, you will need to do the following:

1. Install [tfenv](https://github.com/tfutils/tfenv)
1. Install the proper version of Terraform as defined in the [`.terraform-version`](terraform/.terraform-version) file. Example:

    ```bash
    tfenv install x.x.x
    ```

1. Obtain a Terraform API token from a [Core Contributor](https://github.com/orgs/the-hideout/teams/core-contributors) - Note: Only trusted contributors will be given this level of access
1. Run `terraform login` and paste the token when prompted
1. Run `terraform init` to setup your workspace in the `terraform/` directory
1. Edit the [`terraform.auto.tfvars.json.example`](terraform/terraform.auto.tfvars.json.example) file to contain your proper tokens and remove the `.example` from the file name - **Never** commit this file

    > Note: This file will require you to fill in a `CLOUDFLARE_TOKEN` that can also be obtained from a [Core Contributor](https://github.com/orgs/the-hideout/teams/core-contributors)

1. You should now be all setup and able to run a `terraform plan`!

### Reaching Out 💬

Should you need assistance or have any questions using this repository, you can always join our [Discord](https://discord.gg/XPAsKGHSzH) for assistance.
