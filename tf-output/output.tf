output "webserver-instance-id" {
  value = aws_instance.my_webserver.id 
}

output "webserver_elastic_public_ip" {
  value = aws_eip.my_static_ip.public_ip
}
