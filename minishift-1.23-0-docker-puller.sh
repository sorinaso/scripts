PULL_TIMEOUT=60s
REPEAT_TIMES=10

echo "Repitiendo ${REPEAT_TIMES} veces con timeout de ${PULL_TIMEOUT}"

for d in $(seq 1 $REPEAT_TIMES); do timeout $PULL_TIMEOUT docker pull openshift/origin-control-plane:v3.10; done;
