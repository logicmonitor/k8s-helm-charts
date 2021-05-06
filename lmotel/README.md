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
helm install -n <namespace> \
--set lm.account=<lm_company_name> \
--set lm.bearer_token=<lm_bearer_token> \
--set lm.otel_name=<lmotel_collector_name> \ 
--set replicaCount=<number_of_replicas>
lmotel logicmonitor/lmotel
```
---
Required Values:
- **account (default: `""`):** The LogicMonitor account name.
- **bearer_token (default: `""`):** Bearer token of user having Data Ingestion permissions.
- **otel_name (default: `""`):** The LogicMonitor Otel Collector name.
---
Optional Values:
- **replicaCount (default: `1`):** Number of replicas of lmotel kubernetes pod.