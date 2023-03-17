resource "openstack_compute_instance_v2" "instance-tp" {
  name            = "basic2"
  image_id        = "375ed21c-0c1e-45b8-8c83-a5556adcfff9"
  flavor_name     = "v1.m1.d10"
  security_groups = ["default", openstack_networking_secgroup_v2.secgroup-projet.name, openstack_networking_secgroup_v2.http-tp.name]

  metadata = {
    this = "that"
  }

  network {
    name = openstack_networking_network_v2.network.name
  }
}