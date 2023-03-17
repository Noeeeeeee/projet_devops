
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "public"
}

resource "openstack_networking_port_v2" "port_1" {
  network_id = openstack_networking_network_v2.network.id
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.floatip_1.address
  instance_id = openstack_compute_instance_v2.instance-tp.id
}

