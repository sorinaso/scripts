PULL_TIMEOUT=3s
REPEAT_TIMES=10

for d in $(seq 1 $REPEAT_TIMES); do timeout $PULL_TIMEOUT docker pull openshift/origin-control-plane:v3.10; done;
