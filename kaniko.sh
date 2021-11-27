set -e pipefail
rm -rf /kaniko || true
mkdir -p /kaniko/.docker || true
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
 --dockerfile=${dockerfile} \
 --context=git://${gh_token}@github.com/FTBpro/mmservices-auto.git \
 --destination=docker-registry.docker-registry:5000/${image}:${tag} \
 --cache=true \
 --git branch=${branch} \
 --cache-repo=docker-registry.docker-registry:5000/${image}-cache