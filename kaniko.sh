set -e pipefail

echo "test ${tag}"


mkdir -p /kaniko/.docker
echo "creating auth config file"
cat <<EOF >/kaniko/.docker/config.json
{
  "insecure-registries" : ["docker-registry.docker-registry:5000"]
}
EOF

cat /kaniko/.docker/config.json

/usr/bin/executor \
 --insecure \
 --force \
 --dockerfile=${dockerfile} \
 --context=git://${context}@github.com/FTBpro/mmservices-auto.git#${tag} \
 --destination=docker-registry.docker-registry:5000/${image}:${tag} \
 --cache=true \
 --cache-repo=docker-registry.docker-registry:5000/${image}-cache