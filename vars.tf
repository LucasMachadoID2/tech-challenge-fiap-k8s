variable "projectName" {
  default = "tech-challenge-fiap"
}
variable "region_default" {
  default = "us-east-1"
}
variable "instace_type" {
  default = "t3.medium"
}
variable "role_eks_cluster" {
  default = "arn:aws:iam::955655757785:role/c173096a4485959l11231379t1w955655-LabEksClusterRole-m4qqQlksFcNz"
}
variable "role_eks_node" {
  default = "arn:aws:iam::955655757785:role/c173096a4485959l11231379t1w955655757-LabEksNodeRole-JIDSccCFYxqU"
}
variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-0328f13dd2d347ca4",
    "subnet-02bf558fe210fe77c",
    "subnet-0ea4f4663e9c54392"
  ]
}
