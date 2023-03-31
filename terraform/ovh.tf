
resource "ovh_domain_zone_record" "cloud" {
  zone = "uca-devops.ovh"
  subdomain = "cloud-noe"
  fieldtype = "A"
  ttl = 3600
  target = var.ip_address
}

resource "ovh_domain_zone_record" "blog" {
  zone = "uca-devops.ovh"
  subdomain = "blog-noe"
  fieldtype = "A"
  ttl = 3600
  target = var.ip_address
}

resource "ovh_domain_zone_record" "projet" {
  zone = "uca-devops.ovh"
  subdomain = "projet-noe"
  fieldtype = "A"
  ttl = 3600
  target = var.ip_address
}