resource "kubectl_manifest" "configmap" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  AWS_REGION: ${var.region_default}
  USERS_TABLE_NAME: ${aws_dynamodb_table.users.name}
  ORDERS_TABLE_NAME: ${aws_dynamodb_table.orders.name}
  PRODUCTS_TABLE_NAME: ${aws_dynamodb_table.products.name}
  PAYMENTS_TABLE_NAME: ${aws_dynamodb_table.payments.name}
  SPRING_PROFILES_ACTIVE: "dynamodb"
YAML
}