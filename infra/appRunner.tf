# this is extra and only to show how to use ECR in a app runner
# commented out this resource as I did not want overcharge the AWS subscription

#resource "aws_apprunner_service" "service" {
#  service_name = "${var.candidate_id}-app-runner"
#
#  source_configuration {
#
#    authentication_configuration {
#      access_role_arn = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
#    }
#
#    image_repository {
#      image_configuration {
#        port = "8080"
#      }
#      image_identifier      = "${aws_ecr_repository.repository.repository_url}:latest"
#      image_repository_type = "ECR"
#    }
#    auto_deployments_enabled = true
#  }
#}