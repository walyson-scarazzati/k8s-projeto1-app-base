#!/bin/bash

echo "Criando as imagens....."

docker build -t walysonsilva/projeto-backend:1.0 backend/.
docker build -t walysonsilva/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push walysonsilva/projeto-backend:1.0
docker push walysonsilva/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes.."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml