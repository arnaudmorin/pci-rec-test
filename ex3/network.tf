#-------------------------------------------------------------------------------
# Network
#-------------------------------------------------------------------------------

resource "openstack_networking_router_v2" "generic" {
  name                = "router-generic"
  external_network_id = var.external_gateway
}

resource "openstack_networking_network_v2" "generic" {
  name = "network-generic"
}


resource "openstack_networking_subnet_v2" "nginxnode" {
  name            = var.network_nginxnode["subnet_name"]
  network_id      = openstack_networking_network_v2.generic.id
  cidr            = var.network_nginxnode["cidr"]
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_router_interface_v2" "nginxnode" {
  router_id = openstack_networking_router_v2.generic.id
  subnet_id = openstack_networking_subnet_v2.nginxnode.id
}


#-------------------------------------------------------------------------------
# Security groups
#-------------------------------------------------------------------------------


# HTTP
resource "openstack_compute_secgroup_v2" "http" {
  name        = "http"
  description = "Open input http port"
  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}


# SSH
resource "openstack_compute_secgroup_v2" "ssh" {
  name        = "ssh"
  description = "Open input ssh port"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

