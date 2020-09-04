# collectorset-controller

This Helm chart installs [collectorset-controller](https://github.com/logicmonitor/k8s-collectorset-controller). A [LogicMonitor](https://www.logicmonitor.com) account is required.

```bash
$ helm upgrade \
  --install \
  --debug \
  --wait \
  --tiller-namespace="$NAMESPACE" \
  --set accessID="$ACCESS_ID" \
  --set accessKey="$ACCESS_KEY" \
  --set account="$ACCOUNT" \
  --set clusterName="$CLUSTER_NAME" \
  --set etcdDiscoveryToken="$ETCD_DISCOVERY_TOKEN" \
  --set imageTag="$IMAGE_TAG" \
  --set proxyURL="$PROXY_URL" \
  --set proxyUser="$PROXY_USER" \
  --set proxyPass="$PROXY_PASS" \
  collectorset-controller logicmonitor/collectorset-controller
```

Required Values:

- **accessID:** The LogicMonitor API key ID.
- **accessKey:** The LogicMonitor API key.
- **account:** The LogicMonitor account name.
- **clusterName:** A unique name given to the cluster's device group.

Optional Values:

- **enableRBAC (default: `true`):** Enable RBAC.
- **etcdDiscoveryToken:** The public etcd discovery token used to add etcd hosts to the cluster device group.
- **imagePullPolicy (default: `"Always"`):**
- **imageRepository (default: `"logicmonitor/collectorset-controller"`):** The respository to use for the Argus docker image.
- **imageTag:** The collectorset-controller image tag to use.
- **proxyURL (default: `""`):** The Http/s proxy url.
- **proxyUser (default: `""`):** The Http/s proxy username.
- **proxyPass (default: `""`):** The Http/s proxy password.
- **priorityClassName (default: `""`):** The priority class name for Pod priority. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **tolerations:** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.

**Tolerations Example:**
```bash
$ helm upgrade --reuse-values \
  --set tolerations[0].key="key1" \
  --set tolerations[0].operator="Equal" \
  --set tolerations[0].value="value1" \
  --set tolerations[0].effect="NoSchedule" \
  collectorset-controller logicmonitor/collectorset-controller
```
