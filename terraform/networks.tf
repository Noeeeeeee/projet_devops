
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
  name           = "projet-network"
  admin_state_up = "true"
}

# Network Subnet
resource "openstack_networking_subnet_v2" "subnet" {
  name            = "my-network-subnet"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = var.cidr
  ip_version      = 4
}

# Interface between Router and Subnet
resource "openstack_networking_router_interface_v2" "interface" {
  router_id = openstack_networking_router_v2.global.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "public"
}

resource "openstack_networking_port_v2" "port_1" {
  network_id = openstack_networking_network_v2.network.id
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.floatip_1.address
  instance_id = openstack_compute_instance_v2.instance_tp.id
}

resource "openstack_networking_secgroup_v2" "secgroup" {
  name = "secgroup"
}

resource "openstack_networking_secgroup_v2" "http" {
  name = "http"
}

resource "openstack_networking_secgroup_rule_v2" "rule" {
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}

resource "openstack_networking_secgroup_rule_v2" "rule2" {
  security_group_id = openstack_networking_secgroup_v2.http.id
  protocol = "tcp"
  port_range_min = 80
  port_range_max = 80
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}

resource "openstack_networking_secgroup_rule_v2" "wordpress_https_rule" {
  security_group_id = openstack_networking_secgroup_v2.http.id
  protocol = "tcp"
  port_range_min = 443
  port_range_max = 443
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}

resource "openstack_networking_secgroup_rule_v2" "nextcloud_http_rule" {
  security_group_id = openstack_networking_secgroup_v2.http.id
  protocol = "tcp"
  port_range_min = 8080
  port_range_max = 8080
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}

resource "openstack_networking_secgroup_rule_v2" "nextcloud_https_rule" {
  security_group_id = openstack_networking_secgroup_v2.http.id
  protocol = "tcp"
  port_range_min = 8443
  port_range_max = 8443
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}

resource "openstack_networking_secgroup_rule_v2" "mariadb_rule" {
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
  protocol = "tcp"
  port_range_min = 3306
  port_range_max = 3306
  remote_ip_prefix = "0.0.0.0/0"
  direction = "ingress"
  ethertype = "IPv4"
}