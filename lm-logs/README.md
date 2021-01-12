## Send Kubernetes logs to LM Logs

This chart deploy a fluentd based daemonset to collect and forward logs to LogicMonitor
#### Prerequisite
- LogicMonitor Collector [installed and monitoring your Kubernetes Cluster](https://www.logicmonitor.com/support/monitoring/containers/kubernetes/adding-your-kubernetes-cluster-into-monitoring). 

#### Deploy

Install the lm-logs chart, filling in the required values.

``` console
helm install -n <namespace> \
--set lm_company_name="<lm_company_name>" \
--set lm_access_id="<lm_access_id>" \
--set lm_access_key="<lm_access_key>" \
lm-logs logicmonitor/lm-logs
```

#### Parameters
The following tables lists the configurable parameters of the lm-logs chart and their default values.
| Parameter                   | Description                                     | Default                                                 |
|-----------------------------|-------------------------------------------------|---------------------------------------------------------|
| `global.imagePullSecrets`   | List of global registry secret names            | `[]` (does not add image pull secrets to deployed pods) |
| `global.nameOverride`       | Global storage class for dynamic provisioning   | `""`                                                    |
| `global.fullnameOverride`   | Global storage class for dynamic provisioning   | `""`                                                    |
| `global.lm_company_name`    | LogicMonitor account name                       | `nil`                                                   |
| `global.lm_access_id`       | LogicMonitor API Token Access ID                | `nil`                                                   |
| `global.lm_access_key`      | LogicMonitor API Token Access Key               | `nil`                                                   |
| `image.repository`          | Container image repository                      | `logicmonitor/lm-logs-k8s-fluentd`                      |
| `image.pullPolicy`          | Container image pull policy                     | `IfNotPresent`                                          |
| `image.tag`                 | Container image tag                             | `""`                                                    |
| `resources.limits.memory`   | Container memory resource limit                 | `300Mi`                                                 |
| `resources.requests.cpu.`   | Container cpu resource requests                 | `100m`                                                  |
| `resources.requests.memory` | Container memory resource requests              | `100Mi`                                                 |
| `tolerations`               | Tolerations for pod assignment	                | `{}`  (evaluated as a template)                         |
| `nodeSelectors`             | Node labels for pod assignment		            | `{}`  (evaluated as a template)                         |
| `affinity`                  | Affinity for pod assignment		                | `{}`  (evaluated as a template)                         |
| `env`                       | Map to add extra environment variables	        | {}                                                      |

### Avaialble Environment variables
For descriptions see: https://github.com/fabric8io/fluent-plugin-kubernetes_metadata_filter

* FLUENT_LOG_LEVEL
* FLUENT_CONTAINER_TAIL_TAG 
* FLUENT_CONTAINER_TAIL_EXCLUDE_PATH
* FLUENT_CONTAINER_TAIL_PARSER_TYPE
* FLUENT_FILTER_KUBERNETES_URL
* KUBERNETES_VERIFY_SSL
* KUBERNETES_CA_FILE
* FLUENT_KUBERNETES_METADATA_SKIP_LABELS
* FLUENT_KUBERNETES_METADATA_SKIP_CONTAINER_METADATA
* FLUENT_KUBERNETES_METADATA_SKIP_MASTER_URL
* FLUENT_KUBERNETES_METADATA_SKIP_NAMESPACE_METADATA
