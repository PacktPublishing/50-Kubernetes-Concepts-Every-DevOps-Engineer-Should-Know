1. Create a namespace for ArgoCD
`kubectl create namespace argocd`

2. Install Argo
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml`

3. Get the initial admin password
`kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

4. Open up Argo's UI
`kubectl port-forward -n argocd service/argocd-server :80`

5. Log into the server via the CLI. The port is what ArgoCD is hosting hosted on from the `kubectl port-forward` section in **Server Installation**
`argocd login 127.0.0.1:argocd_port_here`

6. In the Argo CD UI, go to User Info --> Update Password

7. Change the password from the initial admin password to a password of your choosing

8. Create a Namespace for your new app
```
kubectl create namespace sock-shop
```

The Socks App is a popular microservice demo which you can find here: https://microservices-demo.github.io/deployment/kubernetes-start.html

9. Deploy the Socks App in ArgoCD.
```
argocd app create socks --repo https://github.com/microservices-demo/microservices-demo.git --path deploy/kubernetes --dest-server https://kubernetes.default.svc --dest-namespace sock-shop
```

10. Check the status of the app
```
argocd app get socks
```

11. Check that the app was deployed in the ArgoCD UI
