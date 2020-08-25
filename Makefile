all: charts index lint

.PHONY: charts
charts:
	
	@helm package argus --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts
	
	@helm package releasemanager --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-release-manager

	@helm package collectorset-controller --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts

index:
	helm repo index ./ --url https://logicmonitor.github.com/k8s-helm-charts
	sed -i '' 's/\/docs//' index.yaml
	mv index.yaml ./docs

lint:
	@helm lint --strict argus --set accessID=dummy \
	--set accessKey=dummy \
	--set account=dummy \
	--set clusterName=dummy \
	--set collector.size=dummy
	@helm lint --strict releasemanager
	@helm lint --strict collectorset-controller
