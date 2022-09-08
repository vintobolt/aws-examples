# Lifecycles
```
lifecycles {
    prevent_destroy = true,
    create_before_destroy = true,
    ignore_changes = ["ami", "user_data"]
}
```

# Elastic IP
Если не указать VPC = true будет ругаться подобным образом.

```
│ Error: with the retirement of EC2-Classic no new non-VPC EC2 EIPs can be created
```

```
resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  vpc = true
  tags = {
    Name = "Web Server IP"
    Owner = "OZ"
  }
}
```
