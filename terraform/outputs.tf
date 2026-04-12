output "droplet_ip" {
  description = "IP address of the droplet"
  value       = digitalocean_droplet.portfolio.ipv4_address
}