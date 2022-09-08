
all: apply-all

promote:
	bin/promote.sh

abort:
	kubectl argo rollouts abort bg-rollout

use-local-k8s:
	kubectl config use-context docker-desktop

apply-all: use-local-k8s apply-configmap apply-services apply-analysis-template apply-rollout

apply-configmap: use-local-k8s
	kubectl apply -f manifests/configmap.yaml

apply-services: use-local-k8s
	kubectl apply -f manifests/services.yaml

apply-analysis-template: use-local-k8s
	kubectl apply -f manifests/analysis_template.yaml

apply-rollout: use-local-k8s
	kubectl apply -f manifests/rollout.yaml

.PHONY: promote abort use-local-k8s
.PHONY: apply-all apply-configmap apply-services apply-analysis-template apply-rollout 