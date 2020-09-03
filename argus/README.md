# Argus

This Helm chart installs [Argus](https://github.com/logicmonitor/k8s-argus). A [LogicMonitor](https://www.logicmonitor.com) account is required.

```bash
$ helm upgrade \
  --install \
  --debug \
  --wait \
  --tiller-namespace="$NAMESPACE" \
  --set accessID="$ACCESS_ID" \
  --set accessKey="$ACCESS_KEY" \
  --set account="$ACCOUNT" \
  --set clusterGroupID="$CLUSTER_GROUP_ID" \
  --set clusterName="$CLUSTER_NAME" \
  --set etcdDiscoveryToken="$ETCD_DISCOVERY_TOKEN" \
  --set imageTag="$IMAGE_TAG" \
  --set proxyURL="$PROXY_URL" \
  --set proxyUser="$PROXY_USER" \
  --set proxyPass="$PROXY_PASS" \
  --set collector.imageRepository="$COLLECTOR_IMAGE_REPOSITORY" \
  --set collector.imageTag="$COLLECTOR_IMAGE_TAG" \
  --set collector.imagePullPolicy="$COLLECTOR_IMAGE_PULL_POLICY" \
  --set collector.replicas="$COLLECTOR_REPLICAS" \
  --set collector.size="$COLLECTOR_SIZE" \
  --set collector.groupID="$COLLECTOR_GROUP_ID" \
  --set collector.escalationChainID="$COLLECTOR_ESCALATION_CHAIN_ID" \
  --set collector.version="$COLLECTOR_VERSION" \
  --set collector.useEA="$COLLECTOR_USE_EA" \
  --set collector.proxyURL="$COLLECTOR_PROXY_URL" \
  --set collector.proxyUser="$COLLECTOR_PROXY_USER" \
  --set collector.proxyPass="$COLLECTOR_PROXY_PASS" \
  argus logicmonitor/argus
```

Required Values:

- **accessID:** The LogicMonitor API key ID.
- **accessKey:** The LogicMonitor API key.
- **account:** The LogicMonitor account name.
- **clusterName:** A unique name given to the cluster's device group.
- **collector.replicas:** The number of collectors to create and use with Argus.
- **collector.size:** The collector size to install. Can be nano, small, medium, or large.
- **etcdDiscoveryToken:** The public etcd discovery token used to add etcd hosts to the cluster device group.

Optional Values:

- **debug (default: `false`):** Enable debug logging.
- **deleteDevices (default: `true`):** On a delete event, either delete from LogicMonitor or move the device to the `_delted` device group.
- **disableAlerting (default: `false`):** Disable alerting for all devices added.
- **enableRBAC (default: `true`):** Enable RBAC.
- **clusterGroupID:** A parent group id of the cluster's device group.
- **etcdDiscoveryToken:** The public etcd discovery token used to add etcd hosts to the cluster device group.
- **imagePullPolicy (default: `"Always"`):**
- **imageRepository (default: `"logicmonitor/argus"`):** The respository to use for the Argus docker image.
- **imageTag:** The argus container image tag to use.
- **proxyURL (default: `""`):** The Http/s proxy url.
- **proxyUser (default: `""`):** The Http/s proxy username.
- **proxyPass (default: `""`):** The Http/s proxy password.
- **priorityClassName (default: `""`):** The priority class name for Pod priority. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **tolerations:** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.
- **collector.imageRepository (default: `logicmonitor/collector`):** The image repository of the collector.
- **collector.imageTag (default: `latest`):** The image tag of the collector.
- **collector.imagePullPolicy (default: `Always`):** The image pull policy of the collector.
- **collector.groupID:** The ID of the group of the collectors.
- **collector.escalationChainID:** The ID of the escalation chain of the collectors.
- **collector.version:** The version of the collectors.
- **collector.useEA:** On a collector downloading event, either download the latest EA version or the latest GD version.
- **collector.proxyURL (default: `""`):** The Http/s proxy url of the collectors.
- **collector.proxyUser (default: `""`):** The Http/s proxy username of the collectors.
- **collector.proxyPass (default: `""`):** The Http/s proxy password of the collectors.
- **collector.priorityClassName (default: `""`):** The priority class name for Pod priority of the collector. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **collector.tolerations:** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.

**Tolerations Example:**
```bash
$ helm upgrade --reuse-values \
  --set tolerations[0].key="key1" \
  --set tolerations[0].operator="Equal" \
  --set tolerations[0].value="value1" \
  --set tolerations[0].effect="NoSchedule" \
  --set collector.tolerations[0].key="key2" \
  --set collector.tolerations[0].operator="Equal" \
  --set collector.tolerations[0].value="value2" \
  --set collector.tolerations[0].effect="NoExecute" \
  argus logicmonitor/argus
```
