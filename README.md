### Use a local registry:

docker run -d -p 5000:5000 --restart=always --name local-registry registry:2

### Now tag your image properly:

docker tag go-test1 localhost:5000/go-test1

### Note that localhost should be changed to the DNS name of the machine running registry container.

### Now push your image to the local registry:

docker push localhost:5000/go-test1


kubectl apply -f pod.yaml

kubectl get pods

kubectl port-forward pod/go-test1 8001:8000