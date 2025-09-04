resource "kubectl_manifest" "configmap" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  SPRING_DATA_MONGODB_HOST: mongodb
  SPRING_DATA_MONGODB_PORT: "27017"
  SPRING_DATA_MONGODB_DATABASE: tech-chall
YAML
}
