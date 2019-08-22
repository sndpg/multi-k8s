docker build -t sanp/multi-c-client:latest -t sanp/multi-c-client:$SHA -t sanp/multi-c-client:$1 -f ./client/Dockerfile ./client
docker build -t sanp/multi-c-server:latest -t sanp/multi-c-server:$SHA -t sanp/multi-c-server:$1 -f ./server/Dockerfile ./server
docker build -t sanp/multi-c-worker:latest -t sanp/multi-c-worker:$SHA -t sanp/multi-c-worker:$1 -f ./worker/Dockerfile ./worker
docker push sanp/multi-c-client:latest
docker push sanp/multi-c-client:$SHA
docker push sanp/multi-c-client:$1
docker push sanp/multi-c-server:latest
docker push sanp/multi-c-server:$SHA
docker push sanp/multi-c-server:$1
docker push sanp/multi-c-worker:latest
docker push sanp/multi-c-worker:$SHA
docker push sanp/multi-c-worker:$1
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=sanp/multi-c-client:$1
kubectl set image deployments/server-deployment server=sanp/multi-c-server:$1
kubectl set image deployments/worker-deployment worker=sanp/multi-c-worker:$1