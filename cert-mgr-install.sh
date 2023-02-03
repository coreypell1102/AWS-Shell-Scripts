#Applys CRDs
echo "Applying Cert Manager CRDs"
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
echo "CRDs Applied"

#Deploys cert manager
echo "Deploying Cert Manager"
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.5.1
echo "Cert Manager Deployed"
