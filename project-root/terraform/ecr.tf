resource "aws_ecr_repository" "flask" {
  name                 = "${var.project}-flask"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "express" {
  name                 = "${var.project}-express"
  image_tag_mutability = "MUTABLE"
}
