
CLI
```
argocd app create --name test \
--repo https://github.com/abkshaw/TS-Lighthouse-ArgoCD.git \
--dest-server https://kubernetes.default.svc \
--dest-namespace lighthouse --path kubernetes
```

YAML

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: test
  namespace: lighthouse
spec:
  project: default
  source:
    repoURL: https://github.com/abkshaw/TS-Lighthouse-ArgoCD.git
    targetRevision: HEAD
    path: example-app
  destination:
    server: https://kubernetes.default.svc
    namespace: lighthouse
```

