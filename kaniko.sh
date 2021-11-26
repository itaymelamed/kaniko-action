set -e pipefail

echo "test ${tag}"


mkdir -p /kaniko/.docker
cat <<EOF >/kaniko/.docker/config.json
{
    "auths": {
        "https://${REGISTRY}": {
            "username": "${username}",
            "password": "${password}"
        }
    }
}
EOF

/usr/bin/executor --force --context=posts-service --destination=minutemedia/${image}:${tag} --cache=true