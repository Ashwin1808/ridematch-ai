resource "aws_autoscaling_policy" "scale_up" {

  name = "ridematch-scale-up"

  autoscaling_group_name = var.autoscaling_group_name

  adjustment_type = "ChangeInCapacity"

  scaling_adjustment = 1

  cooldown = 300

}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {

  alarm_name = "ridematch-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 120

  statistic = "Average"

  threshold = 70

  alarm_description = "Scale when CPU exceeds 70%"

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  alarm_actions = [
    aws_autoscaling_policy.scale_up.arn
  ]

}