apiVersion: apps/v1
kind: Deployment
metadata:
  name: task-deployment
  labels:
    app: task
spec:
  replicas: 2
  selector:
    matchLabels:
      app: task
  template:
    metadata:
      labels:
        app: task
    spec:
      containers:
      - name: task-container
        image: bishal350/code  # Your Docker image name here
        ports:
        - containerPort: 8080
        envFrom:
        - secretRef:
            name: aws-secrets-env  
      imagePullSecrets:
      - name: dhcred  
