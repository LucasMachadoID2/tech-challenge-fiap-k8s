resource "aws_eks_cluster" "cluster" {
  name = "eks-tech-challenge-fiap"

  access_config {
    authentication_mode = "API"
  }

  # Aqui você usa o ARN da role que já existe na sua conta
  role_arn = "arn:aws:iam::955655757785:role/c173096a4485959l11231379t1w955655-LabEksClusterRole-e1hSKJMsVOzQ"

  version = "1.31"

  vpc_config {
    subnet_ids = [
      "subnet-05e57c48e90a658f2", # AZ1
      "subnet-058d56d498f0e4f3a", # AZ2
      "subnet-0a22fa80ed3fe3a80", # AZ3
    ]
  }
}
