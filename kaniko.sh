set -e pipefail

export COMMIT_SHA=${INPUT_COMMIT_SHA}
echo "test ${COMMIT_SHA}"


mkdir -p /kaniko/.docker
cat <<EOF >/kaniko/.docker/config.json
{
    "auths": {
        "https://${REGISTRY}": {
            "username": "${USERNAME}",
            "password": "${PASSWORD}"
        }
    }
}
EOF

/usr/bin/executor --force --context=posts-service --destination=minutemedia/test:tag