terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "portfolio" {
  name   = "devops-fullstack-lab"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  image  = "ubuntu-24-04-x64"
  ssh_keys = [var.ssh_fingerprint]

  tags = ["portfolio", "devops"]
}