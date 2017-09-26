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
  --set account='$ACCOUNT' \
  --set clusterName='$CLUSTER_NAME' \
  --set collectorDescription='$COLLECTOR_DESCRIPTION' \
  --set collectorImageTag='$COLLECTORIMAGETAG' \
  --set collectorSize='$COLLECTORSIZE' \
  --set etcdDiscoveryToken='$ETCD_DISCOVERY_TOKEN' \
  --set imageTag='$IMAGE_TAG' \
  argus logicmonitor/argus
```

Values:
-   **accessID:** The LogicMonitor API key ID.
-   **accessKey:** The LogicMonitor API key.
-   **account:** The LogicMonitor account name.
-   **clusterName:** A unique name given to the cluster's device group.
-   **collectorDescription:** A unique collector description used to look up a collector dynamically.
-   **collectorImageTag:** The collector image tag.
-   **collectorSize:** The collector size to install. Can be nano, small, medium, or large.
-   **etcdDiscoveryToken:** The public etcd discovery token used to add etcd hosts to the cluster device group.
-   **imageTag:** The argus image tag to use.
-   **useEACollector:** Use an early access collector.
