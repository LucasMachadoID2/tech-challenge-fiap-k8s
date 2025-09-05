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
  default = "arn:aws:iam::955655757785:role/c173096a4485959l11231379t1w955655-LabEksClusterRole-s7bEslNxcDPl"
}
variable "role_eks_node" {
  default = "arn:aws:iam::955655757785:role/c173096a4485959l11231379t1w955655757-LabEksNodeRole-SyQ89186O4Mt"
}
variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-050c143924d712646",
    "subnet-079b49b3e82add6cf",
    "subnet-09fb84317794bbd19"
  ]
}