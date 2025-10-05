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
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335-LabEksClusterRole-Y5Os8P5kzZwA"
}
variable "role_eks_node" {
  default = "arn:aws:iam::730335652151:role/c176277a4554083l11733099t1w730335652-LabEksNodeRole-LAN3GLa7tbci"
}

variable "aws_access_key_id"{
  type = string
  sensitive = true
}

variable "aws_secret_key"{
  type = string
  sensitive = true
}

variable "aws_session_token"{
  type = string
  sensitive = true
}



variable "public_subnet_ids" {
  type = list(string)
  default = [
    "subnet-0528d0d97629298f3",
    "subnet-0c58878b132d7af43",
    "subnet-0c9595595afbd7a53"
  ]
}