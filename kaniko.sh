set -e pipefail

echo "test ${tag}"


mkdir -p /kaniko/.docker
cat <<EOF >/kaniko/.docker/config.json
{
    "auths": {
        "https://index.docker.io/v1/": {
            "username": "${username}",
            "password": "${password}"
        }
    }
}
EOF

/usr/bin/executor --force --dockerfile=${dockerfile} --context=${context} --destination=minutemedia/${image}:${tag} --cache=true --cache-repo=minutemedia/${image}-cache 