resource "aws_lb_target_group" "nlb_tg" {
  name     = "${var.datacenter}-nlb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "nlb-attach" {
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = var.target_id
  port             = 80
}

resource "aws_lb" "nlb" {
  name               = "${var.datacenter}-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets

  tags = {
    Name = "nlb"
  }
}

resource "aws_lb_listener" "nlb_lsn" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

