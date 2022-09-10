output "webserver-instance-id" {
  value = aws_instance.my_webserver.id
  description = "print instance id"
}

output "webserver_elastic_public_ip" {
  value = aws_eip.my_static_ip.public_ip
  description = "print public ip"
}

output "webserver_cpu_count" {
  value = aws_instance.my_webserver.cpu_core_count
  description = "print cpu count"
}

output "instance_type" {
  value = aws_instance.my_webserver.instance_type
  description = "print instance type"
}