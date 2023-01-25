data "aws_route53_zone" "myzone" {
  name = var.domain_name
}

resource "aws_route53_record" "web" {
  zone_id = data.aws_route53_zone.myzone.id
  name    = "web"
  type    = "CNAME"
  ttl     = 5

  records = [aws_lb.taskalb.dns_name]
}