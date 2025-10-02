resource "kubectl_manifest" "deploy" {
  depends_on = [
    aws_eks_cluster.cluster, 
    aws_eks_node_group.node_group,
    kubectl_manifest.aws_credentials
  ]
  
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
          image: marjorymatos/tech-chall-app:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            # REMOVER a duplicata - usar apenas uma fonte para AWS_REGION
            - name: AWS_REGION
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: AWS_REGION
            - name: DYNAMODB_ORDERS_TABLE
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: DYNAMODB_ORDERS_TABLE
            - name: DYNAMODB_PAYMENTS_TABLE
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: DYNAMODB_PAYMENTS_TABLE
            - name: DYNAMODB_PRODUCTS_TABLE
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: DYNAMODB_PRODUCTS_TABLE
            - name: DYNAMODB_USERS_TABLE
              valueFrom:
                configMapKeyRef:
                  name: app-config
                  key: DYNAMODB_USERS_TABLE
            # Credenciais AWS do Secret
            - name: AWS_ACCESS_KEY_ID
              valueFrom:
                secretKeyRef:
                  name: aws-credentials
                  key: AWS_ACCESS_KEY_ID
            - name: AWS_SECRET_ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-credentials
                  key: AWS_SECRET_ACCESS_KEY
            - name: AWS_SESSION_TOKEN
              valueFrom:
                secretKeyRef:
                  name: aws-credentials
                  key: AWS_SESSION_TOKEN      
            # REMOVER esta linha duplicada:
            # - name: AWS_REGION
            #   valueFrom:
            #     secretKeyRef:
            #       name: aws-credentials
            #       key: AWS_REGION
            # Desabilitar MongoDB
            - name: SPRING_DATA_MONGODB_URI
              value: ""
            - name: SPRING_PROFILES_ACTIVE
              value: "aws"
          resources:
            requests:
              cpu: "500m"
              memory: "512Mi"
            limits:
              cpu: "1"
              memory: "1Gi"
YAML
}