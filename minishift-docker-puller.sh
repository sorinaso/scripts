PULL_TIMEOUT=${PULL_TIMEOUT?"Se debe definir PULL_TIMEOUT ejemplo: 60s"}
REPEAT_TIMES=${REPEAT_TIMES?"Se debe definir REPEAT_TIMES ejemplo: 10"}
MINISHIFT_VERSION=${MINISHIFT_VERSION?"Se debe definir MINISHIFT_VERSION ejemplo: 1.23.0"}

echo "Repitiendo ${REPEAT_TIMES} veces con timeout de ${PULL_TIMEOUT}"

function pull_docker_image() {
  (docker inspect --type=image $1 2&> /dev/null) || (timeout $PULL_TIMEOUT docker pull $1)
}

for d in $(seq 1 $REPEAT_TIMES)
do
  trap "exit 1;" SIGHUP SIGINT SIGTERM
  
  echo "Repeticion numero ${d}:"

  case $MINISHIFT_VERSION in
  1.22.0)
    timeout $PULL_TIMEOUT docker pull openshift/origin:v3.9.0
    #timeout $PULL_TIMEOUT docker pull openshift/origin-control-plane:v3.10
    #timeout $PULL_TIMEOUT docker pull openshift/origin-cli:v3.10
    ;;
  1.23.0)
    #timeout $PULL_TIMEOUT docker pull openshift/origin:v3.10.0
    #timeout $PULL_TIMEOUT docker pull openshift/origin-control-plane:v3.10
    #timeout $PULL_TIMEOUT docker pull openshift/origin-cli:v3.10
    #timeout $PULL_TIMEOUT docker pull openshift/origin-node:v3.10
    pull_docer_image "openshift/origin-node:v3.10"
    ;;
  *)
    echo "Version de Minishift ${MINISHIFT_VERSION} no manejada."
    ;;
  esac
done
