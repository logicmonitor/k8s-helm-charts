# Argus

This Helm chart installs [Argus](https://github.com/logicmonitor/k8s-argus). A [LogicMonitor](https://www.logicmonitor.com) account is required.

```bash
$ helm upgrade \
  --install \
  --debug \
  --wait \
  --namespace="$NAMESPACE" \
  --set accessID="$ACCESS_ID" \
  --set accessKey="$ACCESS_KEY" \
  --set account="$ACCOUNT" \
  --set clusterGroupID="$CLUSTER_GROUP_ID" \
  --set clusterName="$CLUSTER_NAME" \
  --set imageTag="$IMAGE_TAG" \
  --set collector.replicas="$COLLECTOR_REPLICAS" \
  --set collector.size="$COLLECTOR_SIZE" \
  --set collector.groupID="$COLLECTOR_GROUP_ID" \
  argus logicmonitor/argus
```

> **_NOTE:_** For Helm v2 use `--tiller-namespace="$NAMESPACE"` in the helm command.

**Install Argus with custom values yaml file:**

```bash
$ helm upgrade \
  --install \
  --debug \
  --wait \
  --namespace="$NAMESPACE" \
  -f argus-configuration.yaml \
  argus logicmonitor/argus
```

---

**Required Values:**

- **accessID (default: `""`):** The LogicMonitor API key ID.
- **accessKey (default: `""`):** The LogicMonitor API key.
- **account (default: `""`):** The LogicMonitor account name.
- **clusterName (default: `""`):** A unique name given to the cluster's device group.
- **debug (default: `false`):** Enable debug logging.
- **deleteDevices (default: `true`):** On a delete event, either delete from LogicMonitor or move the device to the `_delted` device group.
- **disableAlerting (default: `false`):** Disable alerting for all devices added.
- **collector.replicas (default: `1`):** The number of collectors to create and use with Argus.
- **collector.size (default: `""`):** The collector size to install. Can be nano, small, medium, or large.
- **collector.imageRepository (default: `logicmonitor/collector`):** The image repository of the [Collector](https://hub.docker.com/r/logicmonitor/collector) container.
- **collector.imageTag:** The image tag of the [Collector](https://hub.docker.com/r/logicmonitor/collector/tags) container.
- **collector.imagePullPolicy (default: `Always`):** The image pull policy of the Collector container.
- **collector.secretName (default: `"collector"`):** The Secret resource name of the collectors.

**Optional Values:**

- **enableRBAC (default: `true`):** Enable RBAC.
- **clusterGroupID (default `0`):** A parent group id of the cluster's device group.
- **etcdDiscoveryToken (default: `""`):** The public etcd discovery token used to add etcd hosts to the cluster device group.
- **imagePullPolicy (default: `"Always"`):** The image pull policy of the Argus container.
- **imageRepository (default: `"logicmonitor/argus"`):** The image respository of the [Argus](https://hub.docker.com/r/logicmonitor/argus) container.
- **imageTag:** The image tag of the [Argus](https://hub.docker.com/r/logicmonitor/argus/tags) container.
- **proxyURL (default: `""`):** The Http/s proxy url.
- **proxyUser (default: `""`):** The Http/s proxy username.
- **proxyPass (default: `""`):** The Http/s proxy password.
- **nodeSelector (default: `{}`):** It provides the simplest way to run Pod on particular Node(s) based on labels on the node.
- **affinity (default: `{}`):** It allows you to constrain which nodes your pod is eligible to be scheduled on.
- **priorityClassName (default: `""`):** The priority class name for Pod priority. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **tolerations (default: `[]`):** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.
- **filters.pod (default: `""`):** The filtered expression for Pod device type. Based on this parameter, Pods would be added/deleted for discovery on LM.
- **filters.service (default: `""`):** The filtered expression for Service device type. Based on this parameter, Services would be added/deleted for discovery on LM.
- **filters.node (default: `""`):** The filtered expression for Node device type. Based on this parameter, Nodes would be added/deleted for discovery on LM.
- **filters.deployment (default: `""`):** The filtered expression for Deployment device type. Based on this parameter, Deployments would be added/deleted for discovery on LM.
- **collector.groupID (default `0`):** The ID of the group of the collectors.
- **collector.escalationChainID (default `0`):** The ID of the escalation chain of the collectors.
- **collector.collectorVersion (default `0`):** The version of the collectors.
- **collector.useEA (default: `false`):** On a collector downloading event, either download the latest EA version or the latest GD version.
- **collector.proxyURL (default: `""`):** The Http/s proxy url of the collectors.
- **collector.proxyUser (default: `""`):** The Http/s proxy username of the collectors.
- **collector.proxyPass (default: `""`):** The Http/s proxy password of the collectors.
- **collector.priorityClassName (default: `""`):** The priority class name for Pod priority of the collector. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **collector.tolerations (default: `[]`):** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.

---

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

**Discovery Filter Example:**

```bash
helm upgrade --reuse-values \
  --set filters.deployment="app =~ 'QA' || app =~ 'Dev'"
  --set filters.pod="app =~ 'node-app'" \
  --set filters.service=\"*\"
  argus logicmonitor/argus
```
