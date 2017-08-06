# Argus

This Helm chart installs [Argus](https://github.com/logicmonitor/k8s-argus). A [LogicMonitor](https://www.logicmonitor.com) account is required.

```bash
$ helm upgrade
  --install \
  --debug \
  --wait \
  --namespace $NAMESPACE \
  --set accessID='$ACCESS_ID' \
  --set accessKey='$ACCESS_KEY' \
  --set clusterName='$CLUSTER_NAME' \
  --set collectorDescription='$COLLECTOR_DESCRIPTION' \
  --set collectorSize='$COLLECTORSIZE' \
  --set collectorVersion='$COLLECTOR_VERSION' \
  --set account='$ACCOUNT' \
  --set imageTag='$IMAGE_TAG' \
  --set etcdDiscoveryToken='$ETCD_DISCOVERY_TOKEN' \
  argus logicmonitor/argus
```

Values:
-   **accessID:** The LogicMonitor API key ID.
-   **accessKey:** The LogicMonitor API key.
-   **clusterName:** A unique name given to the cluster's device group.
-   **collectorDescription:** A unique collector description used to look up a collector dynamically.
-   **collectorSize:** The collector size to install. Can be nano, small, medium, or large.
-   **collectorVersion:** The collector version to install.
-   **account:** The LogicMonitor account name.
-   **imageTag:** The argus image tag to use.
-   **etcdDiscoveryToken:** The public etcd discovery token used to add etcd hosts to the cluster device group.
