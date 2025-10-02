variable "projectName" {
  default = "tech-challenge-fiap"
}
variable "region_default" {
  default = "us-east-1"
}
variable "instace_type" {
  default = "t3.medium"
}
variable "instace_type1" {
  default = "t2.medium"
}
variable "role_eks_cluster" {
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335-LabEksClusterRole-9daLJuffGtiU"
}
variable "role_eks_node" {
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335652-LabEksNodeRole-FrLV6LgSuJCX"
}
variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-09c4fe264ca6da3a1",
    "subnet-05310836d67de8c9b",
    "subnet-05ab5dfa1cc8cccb7"
  ]
}