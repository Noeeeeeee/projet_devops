data "openstack_networking_network_v2" "public" {
  name = "public"
}

# Router for the whole project, linked to the public network
resource "openstack_networking_router_v2" "global" {
  name                = "global"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public.id
}

# Internal Network
resource "openstack_networking_network_v2" "network" {
  name           = "network-projet"
  admin_state_up = "true"
}

# Network Subnet
resource "openstack_networking_subnet_v2" "subnet" {
  name            = "network-projet-subnet"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = "192.168.1.0/24"
  ip_version      = 4
}

# Interface between Router and Subnet
resource "openstack_networking_router_interface_v2" "interface" {
  router_id = openstack_networking_router_v2.global.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

resource "openstack_networking_secgroup_v2" "secgroup-projet" {
  name = "secgroup-projet"
}

resource "openstack_networking_secgroup_rule_v2" "rule" {
  security_group_id = openstack_networking_secgroup_v2.secgroup-projet.id
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  ethertype = "IPv4"
  direction = "ingress"
}

resource "openstack_networking_secgroup_v2" "http-tp" {
  name = "http-tp"
}

resource "openstack_networking_secgroup_rule_v2" "rule_http" {
  security_group_id = openstack_networking_secgroup_v2.http-tp.id
  protocol = "tcp"
  port_range_min = 80
  port_range_max = 80
  remote_ip_prefix = "0.0.0.0/0"
  ethertype = "IPv4"
  direction = "ingress"
}