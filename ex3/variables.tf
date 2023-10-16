#------------------------------------------------------------------------------
# neutron
#------------------------------------------------------------------------------
variable "external_network" {
  type    = string
  default = "Ext-Net"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#-------------------------------------------------------------------------------
# vm part
#-------------------------------------------------------------------------------

variable "image" {
  type    = string
  default = "Centos 7"
}

variable "region_name" {
  description = "Specify region of the instance"
  type        = string
  default     = "GRA7"
}

variable "flavor_nginxnode" {
  description = "Specify flavor of the instance"
  type        = string
  default     = "d2-4"
}

variable "network_nginxnode" {
  type = map(string)
  default = {
    subnet_name = "subnet-http"
    cidr        = "192.168.201.0/24"
  }
}

variable "name" {
  default     = "nginxnode"
  type        = string
  description = "Specif prefix for resources (e.g. key, router)"
}


variable "ssh_user_name" {
  default     = "centos"
  type        = string
  description = "Specify user"
}
