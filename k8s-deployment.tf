resource "kubectl_manifest" "deploy" {
  depends_on = [aws_eks_cluster.cluster, aws_eks_node_group.node_group]
  yaml_body  = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tech-chall-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tech-chall-app
  template:
    metadata:
      labels:
        app: tech-chall-app
    spec:
      containers:
        - name: tech-chall-container
          image: gabitriferreira/tech-challenge-app:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: AWS_REGION
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: AWS_REGION
            - name: USERS_TABLE_NAME
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: USERS_TABLE_NAME
            - name: ORDERS_TABLE_NAME
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: ORDERS_TABLE_NAME
            - name: PRODUCTS_TABLE_NAME
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: PRODUCTS_TABLE_NAME
            - name: PAYMENTS_TABLE_NAME
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: PAYMENTS_TABLE_NAME
            - name: SPRING_PROFILES_ACTIVE
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: SPRING_PROFILES_ACTIVE
            - name: AWS_ACCESS_KEY_ID
              valueFrom:
                secretKeyRef:
                  name: app-secrets
                  key: AWS_ACCESS_KEY_ID
            - name: AWS_SECRET_ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: app-secrets
                  key: AWS_SECRET_ACCESS_KEY
          resources:
            requests:
              cpu: "500m"
              memory: "512Mi"
            limits:
              cpu: "1"
              memory: "1Gi"
YAML
}