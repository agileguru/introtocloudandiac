# output "dev_db_hostname" {
#   value = module.dev_db.db_hostname
# }

# output "dev_db_type_version" {
#   value = module.dev_db.database_type
# }

# output "dev_db_instance_id" {
#   value = module.dev_db.db_instance_id
# }

output "lb_ip_address" {
  value = module.common_load_balancer.lb_ip_address
}
