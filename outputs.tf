output "Dev-PublicWebserver1-IP" {
    value = aws_instance.public-webserver1.public_ip 
}

output "Dev-PublicWebserver2-IP" {
    value = aws_instance.public-webserver2.public_ip 
}

output "alb-dns-name" {
    description = "DNS NAME OF DEV ALB"
    value = "${aws_lb.dev-alb.dns_name}"  
}

