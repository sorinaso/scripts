PULL_TIMEOUT=${PULL_TIMEOUT?"Se debe definir PULL_TIMEOUT ejemplo: 60s"}
REPEAT_TIMES=${REPEAT_TIMES?"Se debe definir REPEAT_TIMES ejemplo: 10"}

echo "Repitiendo ${REPEAT_TIMES} veces con timeout de ${PULL_TIMEOUT}"

for d in $(seq 1 $REPEAT_TIMES); do timeout $PULL_TIMEOUT docker pull openshift/origin-control-plane:v3.10; done;
