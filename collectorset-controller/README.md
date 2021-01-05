# collectorset-controller

This Helm chart installs [collectorset-controller](https://github.com/logicmonitor/k8s-collectorset-controller). A [LogicMonitor](https://www.logicmonitor.com) account is required.

**Install Collectorset-controller:**

Get the configuration file downloaded from the LogicMonitor UI or you can create from the template [here](https://github.com/logicmonitor/k8s-helm-charts/blob/master/config-templates/Configuration.md#collectorset-controller).

Update configuration parameters in configuration file.

```bash
# Export the configuration file path & use it in the helm command.
$ export COLLECTORSET_CONTROLLER_CONF_FILE=<collectorset-controller-configuration-file-path>

$ helm upgrade \
  --install \
  --debug \
  --wait \
  --namespace="$NAMESPACE" \
  -f "$COLLECTORSET_CONTROLLER_CONF_FILE" \
  collectorset-controller logicmonitor/collectorset-controller
```

---

Required Values:

- **accessID (default: `""`):** The LogicMonitor API key ID.
- **accessKey (default: `""`):** The LogicMonitor API key.
- **account (default: `""`):** The LogicMonitor account name.
- **debug (default: `false`):** To enable verbose logging at debug level.

Optional Values:

- **enableRBAC (default: `true`):** Enable RBAC. If your cluster does not have RBAC enabled, this value should be set to false.
- **etcdDiscoveryToken (default: `""`):** The public etcd discovery token used to add etcd hosts to the cluster device group.
- **imagePullPolicy (default: `"Always"`):** The image pull policy of the Collectorset-controller container.
- **imageRepository (default: `"logicmonitor/collectorset-controller"`):** The image repository of the [Collectorset-controller](https://hub.docker.com/r/logicmonitor/collectorset-controller) container.
- **imageTag:** The image tag of the [Collectorset-controller](https://hub.docker.com/r/logicmonitor/collectorset-controller/tags) container.
- **proxyURL (default: `""`):** The Http/s proxy url.
- **proxyUser (default: `""`):** The Http/s proxy username.
- **proxyPass (default: `""`):** The Http/s proxy password.
- **nodeSelector (default: `{}`):** It provides the simplest way to run Pod on particular Node(s) based on labels on the node.
- **affinity (default: `{}`):** It allows you to constrain which nodes your pod is eligible to be scheduled on.
- **priorityClassName (default: `""`):** The priority class name for Pod priority. If this parameter is set then user must have PriorityClass resource created otherwise Pod will be rejected.
- **tolerations (default: `[]`):** Tolerations are applied to pods, and allow the pods to schedule onto nodes with matching taints.

---

**Tolerations Example**

```bash
$ helm upgrade --reuse-values \
  --set tolerations[0].key="key1" \
  --set tolerations[0].operator="Equal" \
  --set tolerations[0].value="value1" \
  --set tolerations[0].effect="NoSchedule" \
  collectorset-controller logicmonitor/collectorset-controller
```
