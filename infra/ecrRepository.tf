# this is extra to creating the ECR
resource "aws_ecr_repository" "repository" {
  name = "${var.candidate_id}-repository"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}