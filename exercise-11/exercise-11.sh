openssl genrsa -out jose.key 2048
openssl req -new -key jose.key -out jose.csr -subj "/CN=jose/O=developers"
cat jose.csr | base64 | tr -d '\n'
# paste into jose-csr.yaml
kubectl apply -f jose-csr.yaml
kubectl certificate approve jose
kubectl get csr jose -o jsonpath='{.status.certificate}' | base64 -d > jose.crt
kubectl create namespace dev
kubectl apply -f jose-role.yaml
kubectl config set-credentials jose --client-certificate=jose.crt --client-key=jose.key
kubectl config set-context jose-dev --cluster=<YOUR_CLUSTER_NAME> --user=jose --namespace=dev
kubectl config use-context jose-dev
kubectl auth can-i get pods -n dev