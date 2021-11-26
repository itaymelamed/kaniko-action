set -e pipefail

echo "test ${INPUT_TAG}"


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

/usr/bin/executor --force --context=${build-file} --destination=minutemedia/${image}:${tag} --cache=true --cache-repo=minutemedia/${image}-cache 