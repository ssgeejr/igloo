output "instance_ip_addr" {
  value = module.igloo_module.instance_ip_addr
  description = "The public IP address of the main instance."
}