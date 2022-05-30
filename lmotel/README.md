## LMOTEL
#### Run logicmonitor otel collector
This chart deploy a lmotel collector to collect and forward traces, and spans to Logicmonitor
#### Prerequisite
- LogicMonitor account with Data Ingestion permission [Logicmonitor account](https://www.logicmonitor.com). 
#### Deploy new collector
1. Add/Update the logicmonitor repo
``` console
helm repo add logicmonitor https://logicmonitor.github.com/k8s-helm-charts
```
OR
``` console
helm repo update
```
2. Install the lmotel chart, filling in the below values.
``` console
Using Bearer token
helm install -n <namespace> \
--set lm.account=<lm_company_name> \
--set lm.bearer_token=<lm_bearer_token> \
--set lm.otel_name=<lmotel_collector_name> \
--set lm.otel_version=<lmotel_collector_version> \
--set replicaCount=<number_of_replicas> \
lmotel logicmonitor/lmotel
```
With LM_V1 token 
``` console
helm install -n <namespace> \
--set lm.account=<lm_company_name> \
--set lm.access_id=<lm_access_id> \
--set lm.access_key=<lm_access_key> \
--set lm.otel_name=<lmotel_collector_name> \
--set lm.otel_version=<lmotel_collector_version> \
--set replicaCount=<number_of_replicas> \
lmotel logicmonitor/lmotel
```

Installing lmotel chart with external config
``` console
Using Bearer token
helm install -n <namespace> \
--set lm.account=<lm_company_name> \
--set lm.bearer_token=<lm_bearer_token> \
--set lm.otel_name=<lmotel_collector_name> \
--set lm.otel_version=<lmotel_collector_version> \
--set replicaCount=<number_of_replicas> \
--set-file=external_config.lmconfig=<custom_configuration_path> \
lmotel logicmonitor/lmotel
```
With LM_V1 token
``` console
helm install -n <namespace> \
--set lm.account=<lm_company_name> \
--set lm.access_id=<lm_access_id> \
--set lm.access_key=<lm_access_key> \
--set lm.otel_name=<lmotel_collector_name> \
--set lm.otel_version=<lmotel_collector_version> \
--set replicaCount=<number_of_replicas> \
--set-file=external_config.lmconfig=<custom_configuration_path> \
lmotel logicmonitor/lmotel
```

To enable logs add the following option
``` console
--set logs.enable=true \
```

---
Required Values:
- **account (default: `""`):** The LogicMonitor account name.
- **bearer_token (default: `""`):** Bearer token of user having Data Ingestion permissions.

or 

- **access_id (default: `""`):** The LogicMonitor access key.
- **access_key (default: `""`):** Access key for logicmonitor account


- **otel_name (default: `""`):** The LogicMonitor Otel Collector name.
---
Optional Values:
- **replicaCount (default: `1`):** Number of replicas of lmotel kubernetes pod.
- **otel_version (default: `""`):** Lmotel collector version.
- **arguments :** command line arguments for lmotel, can be passed as {--log-level, DEBUG}, other options can be added using comma separated values.
---

For using external lmotel configuration

Required Values:
- **account (default: `""`):** The LogicMonitor account name.
- **bearer_token (default: `""`):** Bearer token of user having Data Ingestion permissions.
- **otel_name (default: `""`):** The LogicMonitor Otel Collector name.
- **external_config.lmconfig:** Path to your external configuration
---
Optional Values:
- **replicaCount (default: `1`):** Number of replicas of lmotel kubernetes pod.
- **otel_version (default: `""`):** Lmotel collector version.
---

For using ingress configuration

Required Values:
- **account (default: `""`):** The LogicMonitor account name.
- **bearer_token (default: `""`):** Bearer token of user having Data Ingestion permissions.
- **otel_name (default: `""`):** The LogicMonitor Otel Collector name.
- **ingress.host (default: `""`):** Hostname for the ingress rule
- **ingress.enabled (default: `false`):** This is required to be set true to use ingress

---
Optional Values:
- **replicaCount (default: `1`):** Number of replicas of lmotel kubernetes pod.
- **otel_version (default: `""`):** Lmotel collector version.
- **ingress.ingressClassName (default: `""`):** (Introduced in Kubernetes 1.18) It is a reference to an IngressClass resource that contains additional Ingress configuration, including the name of the Ingress controller.
- **ingress.tls.secretName (default: `""`):** Name of the TLS secret containing the TLS certificates for the hostname.
- **ingress.annotations (default: `{}`):** Annotations common to all the ingress resource definitions.
- **ingress.http.annotations (default: `{}`):** Annotations specific to the ingress-http resource
- **ingress.grpc.annotations (default: `{}`):** Annotations specific to the ingress-grpc resource
