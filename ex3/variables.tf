#------------------------------------------------------------------------------
# neutron
#------------------------------------------------------------------------------
variable "external_network" {
  type    = string
  default = "Ext-Net"
}

variable "external_gateway" {
  type    = string
  default = "f67f0d72-0ddf-11e4-9d95-e1f29f417e2f"
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
  default = "Centos 8"
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
  description = "KeyPair name to create"
}

variable "generate_ssh_key" {
  default     = "true"
  description = "If set to `true`, new SSH key pair will be created"
}
