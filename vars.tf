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
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335-LabEksClusterRole-yu8vfF6O8ayq"
}
variable "role_eks_node" {
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335652-LabEksNodeRole-1WkD0NQZBl2E"
}
variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-06257d9b371b5f3f1",
    "subnet-08567f62853c63244",
    "subnet-089462bc7fa638569"
  ]
}