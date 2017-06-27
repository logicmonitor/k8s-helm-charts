# Argus

Save the following secret to a file named `logicmonitor.yaml`:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: logicmonitor-api-user
  namespace: kube-monitoring
type: Opaque
data:
  company: "COMPANY"
  username: "USERNAME"
  password: "PASSWORD"
  api_id: "API_ID"
  api_key: "API_KEY"
```
This secret is used by Argus to authenticate to LogicMonitor. Now, create the namespace and secret in Kubernetes:
```bash
$ kubectl create namespace kube-monitoring
$ kubectl apply -f logicmonitor.yaml
```
Install Argus:
```bash
$ helm upgrade \
    --install \
    --set collector.tag=latest \
    --set collector.id=COLLECTOR_ID \
    --set argus.tag=latest \
    --set argus.clusterName=CLUSTER_NAME \
    --set argus.secretName=SECRET_NAME \
    argus ./argus
```
