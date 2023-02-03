#Installs Ingress Controller
echo "Installing Nginx Ingress Controller"
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --set controller.service.type=LoadBalancer --create-namespace
echo "Nginx Ingress Controller Installed"

#Applys CRDs
echo "Applying Cert Manager CRDs"
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
echo "CRDs Applied"

#Deploys cert manager
echo "Deploying Cert Manager"
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.5.1
echo "Cert Manager Deployed"

#Installs Rancher
echo "Installing Rancher"
helm install rancher rancher-stable/rancher --namespace cattle-system --set hostname=rancher.cmcloudlab462.info --set replicas=3 --create-namespace
echo "Installation Finished"