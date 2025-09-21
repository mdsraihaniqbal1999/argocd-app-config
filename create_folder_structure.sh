#!/bin/bash

# Create apps/nginx-demo directory and files
mkdir -p apps/nginx-demo
touch apps/nginx-demo/deployment.yaml
touch apps/nginx-demo/service.yaml
touch apps/nginx-demo/kustomization.yaml

# Create argocd/projects directory and file
mkdir -p argocd/projects
touch argocd/projects/demo-project.yaml

# Create argocd/applications directory and file
mkdir -p argocd/applications
touch argocd/applications/nginx-application.yaml

# Create README.md in the current directory
touch README.md

echo "Repository structure created successfully in the current directory."
