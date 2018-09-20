***Testing build***
```bash
docker build -t kubectl .
export KUBE_CONFIG=$(cat ~/.kube/config | base64)
docker run -e "KUBE_CONFIG=${KUBE_CONFIG}" kubectl cluster-info
```