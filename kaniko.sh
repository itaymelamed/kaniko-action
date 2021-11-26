set -e pipefail

echo "test ${tag}"


# mkdir -p /kaniko/.docker
# echo "creating auth config file"
# cat <<EOF >/kaniko/.docker/config.json
# {
# 	"auths": {
# 		"https://index.docker.io/v1/": {
# 			"auth": "${echo -n ${password}:${username} | base64}"
# 		}
# 	}
# }
# EOF

# cat /kaniko/.docker/config.json

/usr/bin/executor \
 --force \
 --dockerfile=${dockerfile} \
 --context=${context} \
 --destination=docker-registry.docker-registry:5000/${image}:${tag} \
 --cache=true \
 --cache-repo=docker-registry.docker-registry:5000/${image}-cache 