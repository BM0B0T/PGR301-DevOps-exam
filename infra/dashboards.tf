resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.candidate_id
  dashboard_body = <<DEATHSTAR
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [  "${var.candidate_id}", "carts.value" ]
        ],
        "title": "avg amount of carts over at a given time",
        "region": "eu-west-1",
        "stat": "Average",
        "period": 5
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [  "${var.candidate_id}", "cartsvalue.value" ]
        ],
        "title": "total amount of chash in all carts at a given time",
        "region": "eu-west-1",
        "stat": "Maximum",
        "period": 5
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [  "${var.candidate_id}", "carts.value" ]
        ],
        "title": "total amount of carts in one hour",
        "region": "eu-west-1",
        "stat": "Sum",
        "period": 3600
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [  "${var.candidate_id}", "checkout_latency.avg", "exception", "none", "method", "checkout", "class", "no.shoppifly.ShoppingCartController" ]
        ],
        "title": "avarege checkout latency",
        "region": "eu-west-1",
        "stat": "Average",
        "period": 60
      }
    }
  ]
}
DEATHSTAR
}