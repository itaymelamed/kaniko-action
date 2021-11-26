set -e pipefail

echo "test ${commit}"


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