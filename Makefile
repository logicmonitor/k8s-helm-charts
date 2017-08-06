all: charts

.PHONY: charts
charts:
	@helm package argus --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts
