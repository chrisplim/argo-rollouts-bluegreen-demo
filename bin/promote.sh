#! /bin/bash

rollout_name="bg-rollout"

# Check existing image
current_image=`kubectl get rollout $rollout_name -o=jsonpath='{.spec.template.spec.containers[0].image}'`

echo $current_image
if [ "$current_image" == "argoproj/rollouts-demo:blue" ]; then
    echo "Changing to image yellow"
    kubectl argo rollouts set image $rollout_name rollouts-demo=argoproj/rollouts-demo:yellow
else
    echo "Changing image to blue"
    kubectl argo rollouts set image $rollout_name rollouts-demo=argoproj/rollouts-demo:blue
fi