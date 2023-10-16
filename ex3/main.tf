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
    port = openstack_networking_port_v2.nginxnode.id
  }
}

#------------------------------------------------------------------------------
# networking
#------------------------------------------------------------------------------

resource "openstack_networking_port_v2" "nginxnode" {
  name           = "port-instance-nginxnode"
  network_id     = openstack_networking_network_v2.generic.id
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
  pool = var.external_network
}

resource "openstack_compute_floatingip_associate_v2" "nginxnode" {
  floating_ip = openstack_networking_floatingip_v2.nginxnode.address
  instance_id = openstack_compute_instance_v2.nginxnode.id
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
