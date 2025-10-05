resource "kubectl_manifest" "configmap" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  AWS_REGION: "us-east-1"
  DYNAMODB_ORDERS_TABLE: "tech-challenge-orders"
  DYNAMODB_PAYMENTS_TABLE: "tech-challenge-payments"
  DYNAMODB_PRODUCTS_TABLE: "tech-challenge-products"
  DYNAMODB_USERS_TABLE: "tech-challenge-users"
YAML
}
