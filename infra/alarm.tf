resource "aws_cloudwatch_metric_alarm" "alertToManyCarts" {
  alarm_name                = "carts-amount-is-over-five-${var.candidate_id}"
  namespace                 = var.candidate_id
  metric_name               = "carts.value"
  comparison_operator       = "GreaterThanThreshold"
  threshold                 = "5"
  evaluation_periods        = "3"
  period                    = "300"
  statistic                 = "Maximum"
  alarm_description         = "This alarm goes off as soon as the total amount of carts exceeds 5 over 3 periods of 5 minutes."
  insufficient_data_actions = []
  alarm_actions       = [aws_sns_topic.alarms.arn]
}