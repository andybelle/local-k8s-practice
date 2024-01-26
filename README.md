### Use a local registry:
docker run -d -p 5000:5000 --restart=always --name local-registry registry:2

docker build -t go-test1 .
docker tag go-test1 localhost:5000/go-test1
docker push localhost:5000/go-test1

kubectl apply -f pod.yaml

kubectl get all

kubectl port-forward pod/go-test1 8001:8000

kubectl apply -f pod.yaml,service.yaml

kubectl apply -f deployment.yaml