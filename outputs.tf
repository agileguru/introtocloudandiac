output "dev_lb_ip_address" {
  value = module.common_load_balancer.lb_ip_address
}

output "akshay_lb_ip_address" {
  value = module.akshay_load_balancer.lb_ip_address
}
