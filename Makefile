all: charts index

.PHONY: charts
charts:
	@helm lint --strict argus
	@helm package argus --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts
	@helm lint --strict releasemanager
	@helm package releasemanager --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-release-manager
	@helm lint --strict collectorset-controller
	@helm package collectorset-controller --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts

index:
	helm repo index ./ --url https://logicmonitor.github.com/k8s-helm-charts
	sed -i '' 's/\/docs//' index.yaml
	mv index.yaml ./docs
