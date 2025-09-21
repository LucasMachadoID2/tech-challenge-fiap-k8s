resource "kubectl_manifest" "secret" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
type: Opaque
stringData:
  AWS_ACCESS_KEY_ID: ${var.aws_access_key}
  AWS_SECRET_ACCESS_KEY: ${var.aws_secret_key}
YAML
}