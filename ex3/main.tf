#------------------------------------------------------------------------------
# instance
#------------------------------------------------------------------------------

resource "openstack_compute_instance_v2" "nginxnode" {
  name        = "nginxnode"
  image_name  = var.image
  flavor_name = var.flavor_nginxnode
  key_pair    = openstack_compute_keypair_v2.this_provided.name
  #user_data   = file("scripts/first-boot.sh")
  region = var.region_name

  network {
    uuid = openstack_networking_network_v2.nginxnode.id
    port = openstack_networking_port_v2.nginxnode.id
  }

}

#------------------------------------------------------------------------------
# networking
#------------------------------------------------------------------------------

data "openstack_networking_network_v2" "generic" {
  name = var.external_network
}

resource "openstack_networking_router_v2" "nginxnode" {
  name                = "${var.name}_router"
  external_network_id = data.openstack_networking_network_v2.generic.id
}

resource "openstack_networking_network_v2" "nginxnode" {
  name = "${var.name}_network"
}

resource "openstack_networking_subnet_v2" "nginxnode" {
  name            = var.network_nginxnode["subnet_name"]
  network_id      = openstack_networking_network_v2.nginxnode.id
  cidr            = var.network_nginxnode["cidr"]
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_router_interface_v2" "nginxnode" {
  router_id = openstack_networking_router_v2.nginxnode.id
  subnet_id = openstack_networking_subnet_v2.nginxnode.id
}

resource "openstack_networking_port_v2" "nginxnode" {
  name           = "port-instance-nginxnode"
  network_id     = openstack_networking_network_v2.nginxnode.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.http.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.nginxnode.id
  }
}

resource "openstack_networking_floatingip_v2" "nginxnode" {
  pool = data.openstack_networking_network_v2.generic.name
}

resource "openstack_compute_floatingip_associate_v2" "nginxnode" {
  floating_ip = openstack_networking_floatingip_v2.nginxnode.address
  instance_id = openstack_compute_instance_v2.nginxnode.id
  fixed_ip    = openstack_compute_instance_v2.nginxnode.network[0].fixed_ip_v4
}

#------------------------------------------------------------------------------
# gen key
#------------------------------------------------------------------------------

resource "openstack_compute_keypair_v2" "this_provided" {

  name = var.name
  #public_key = file(local.private_key_filename)
}

resource "local_file" "private_key_pem" {

  depends_on = [openstack_compute_keypair_v2.this_provided]
  content    = openstack_compute_keypair_v2.this_provided.private_key
  filename   = local.private_key_filename
}
