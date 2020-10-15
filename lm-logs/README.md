## Send k8s logs to LM Logs

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
