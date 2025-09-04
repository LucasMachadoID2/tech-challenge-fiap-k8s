resource "aws_eks_cluster" "cluster" {
  name = "eks-${var.projectName}"

  access_config {
    authentication_mode = "API"
  }

  role_arn = var.role_eks_cluster

  version = "1.31"

  vpc_config {
    subnet_ids = var.public_subnet_ids
  }
}
