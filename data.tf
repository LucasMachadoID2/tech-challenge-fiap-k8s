data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.cluster.name
}
data "aws_eks_cluster_auth" "auth" {
  name = aws_eks_cluster.cluster.name
}

data "aws_vpc" "default" {
  default = true
}


data "kubernetes_service" "eks_service" {
  metadata {
    name = "tech-chall-service"
  }

  depends_on = [
    kubectl_manifest.service,
    aws_eks_cluster.cluster,
    aws_eks_node_group.node_group
  ]
}