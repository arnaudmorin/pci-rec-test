locals {
  private_key_filename = "${path.root}/secrets/${format("%s.%s", var.name, "key")}"
}
