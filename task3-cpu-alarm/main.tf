data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "demo" {
  ami                  = data.aws_ami.al2023.id
  instance_type        = "t3.micro"
  monitoring = true   # detailed monitoring: metrics every 1 minute
  user_data_replace_on_change = true

  user_data = <<-EOF
    #!/bin/bash
    sleep 60
    for i in $(seq 1 $(nproc)); do
      nohup timeout 600 bash -c 'while :; do :; done' >/dev/null 2>&1 &
    done
  EOF

  tags = {
    Name = "cpu-alarm-demo"
  }
}
resource "aws_sns_topic" "alerts" {
  name = "cpu-alarm-demo-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "cpu-alarm-demo-high-cpu"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 60
  evaluation_periods = var.evaluation_periods
  threshold           = var.cpu_threshold
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.demo.id
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]
}
