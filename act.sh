#! /bin/sh

# DIR default to current directory
DIR=${DIR:-$(pwd)}
# Make DIR to absolute path
if [[ "${DIR}" != "/"* ]];then
  DIR="$(pwd)/${DIR}"
fi

PLATFORM=${PLATFORM:-"ubuntu-latest=node:12.20.1-buster-slim"}
ARGS=${ARGS:-""}

SCRIPT="apk add curl;curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sh; act -P ${PLATFORM} -C /project ${ARGS}"

docker run -t --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ~/.docker/config.json:/root/.docker/config.json \
-v ${DIR}:/project \
docker:dind \
/bin/sh -c \
"${SCRIPT}"
