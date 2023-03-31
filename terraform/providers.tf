# On détermine la version du provider OpenStack à utiliser
terraform {
  required_providers {
    openstack = {
      source = "terraform-providers/openstack"
    }
    ovh = {
      source = "ovh/ovh"
    }
  }
  required_version = ">= 1.0.0"
}

# On demande à Terraform d'utiliser le provider téléchargé à l'instant
provider "openstack" {
  cloud = "tp_projet"
}

provider "ovh" {
  endpoint            = "ovh-eu"
  application_key     = "aae409392f908be6"
  application_secret  = "b50ed7a8e334e6f10833d3eddce256a8"
  consumer_key        = "e913ddd09889982b081a683535a07c04"
}




