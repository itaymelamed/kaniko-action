set -e pipefail

echo "test ${tag}"
echo "git://${context}@github.com/FTBpro/mmservices-auto.git#${tag}"

mkdir -p /kaniko/.docker
echo "creating auth config file"
cat <<EOF >/kaniko/.docker/config.json
{
  "insecure-registries" : ["docker-registry.docker-registry:5000"]
}
EOF

cat /kaniko/.docker/config.json

/usr/bin/executor \
 --cleanup \
 --insecure \
 --force \
 -v debug \
 --dockerfile=${dockerfile} \
 --context=git://${context}@github.com/FTBpro/mmservices-auto.git#3b597f15b4dfd025aee070bdb5731702d77f6943 \
 --destination=docker-registry.docker-registry:5000/${image}:${tag} \
 --cache=true \
 --cache-repo=docker-registry.docker-registry:5000/${image}-cache