resource "aws_eks_access_entry" "access_entry23dsas" {
  cluster_name      = aws_eks_cluster.cluster.name
  principal_arn     = "arn:aws:iam::955655757785:role/voclabs"
  kubernetes_groups = ["grupo-1"]
  type              = "STANDARD"
}


resource "aws_eks_access_policy_association" "access_entry_association" {
  cluster_name  = aws_eks_cluster.cluster.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::955655757785:role/voclabs"

  access_scope {
    type = "cluster"
  }
}
