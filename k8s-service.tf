resource "kubectl_manifest" "service" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: tech-chall-service
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
    service.beta.kubernetes.io/aws-load-balancer-scheme: internal
spec:
  type: LoadBalancer
  selector:
    app: tech-chall-app
  ports:
    - name: http
      port: 8080
      targetPort: 8080
YAML
}
