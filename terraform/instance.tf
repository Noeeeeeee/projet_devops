resource "openstack_compute_instance_v2" "instance_tp" {
  name            = "instance_tp"
  image_id        = "375ed21c-0c1e-45b8-8c83-a5556adcfff9"
  flavor_name       = "v2.m4.d10"
  security_groups = ["default", openstack_networking_secgroup_v2.secgroup.name, openstack_networking_secgroup_v2.http.name]
  user_data = file("cloudInit.yaml")

  metadata = {
    this = "that"
  }

  network {
    name = openstack_networking_network_v2.network.name
  }
}