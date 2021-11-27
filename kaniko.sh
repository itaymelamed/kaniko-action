set -e pipefail

mkdir -p /kaniko/.docker
echo "creating auth config file"
cat <<EOF >/kaniko/.docker/config.json
{
  "insecure-registries" : ["docker-registry.docker-registry:5000"]
}
EOF

/usr/bin/executor \
 --cleanup \
 --insecure \
 --force \
 --use-new-run \
 --dockerfile=${dockerfile} \
 --context=git://${gh_token}@github.com/FTBpro/mmservices-auto.git \
 --destination=docker-registry.docker-registry:5000/${image}:${tag} \
 --cache=true \
 --git branch=${branch} \
 --cache-repo=docker-registry.docker-registry:5000/${image}-cache