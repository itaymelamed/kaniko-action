set -e pipefail

export COMMIT_SHA=${COMMIT_SHA}


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

/usr/bin/executor --force --context=git://github.com/FTBpro/mmservices.git#refs/heads/master --destination=minutemedia/test:tag