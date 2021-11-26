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

/usr/bin/executor --force --dockerfile=${dockerfile} --context=git://${github_token}@github.com/FTBpro/mmservices-auto.git\#refs/heads/${branch}\#${tag} --destination=minutemedia/${image}:${tag} --cache=true --cache-repo=minutemedia/${image}-cache 