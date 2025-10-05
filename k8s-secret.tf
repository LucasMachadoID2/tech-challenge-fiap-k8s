resource "kubectl_manifest" "secret" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
type: Opaque
YAML
}

resource "kubectl_manifest" "aws_credentials" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  
  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: aws-credentials
type: Opaque
stringData:
  AWS_ACCESS_KEY_ID: ${var.aws_access_key_id}
  AWS_SECRET_ACCESS_KEY: ${var.aws_secret_key}
  AWS_SESSION_TOKEN: ${var.aws_session_token}
YAML
}

