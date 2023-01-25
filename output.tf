output "alb_dns_name" {
  value       = aws_lb.taskalb.dns_name
  description = "DNS name of ALB"
}

output "dns_record" {
  value       = aws_route53_record.web.fqdn
  description = "DNS name of ALB"
}