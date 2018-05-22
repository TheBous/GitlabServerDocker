docker run --detach \
	--env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab.example.com:30080'; gitlab_rails['gitlab_shell_ssh_port']=30022;" \
	--env GITLAB_ENABLE_REGISTRY=true \
	--env GITLAB_REGISTRY_ENABLED=true \
    --env GITLAB_REGISTRY_HOST=localhost \
    --env GITLAB_REGISTRY_PORT=5005 \
    --env GITLAB_REGISTRY_API_URL=http://registry:5000 \
    --env GITLAB_REGISTRY_KEY_PATH=/certs/registry-auth.key \
    --env SL_REGISTRY_KEY_PATH=/certs/registry.key \
    --env SSL_REGISTRY_CERT_PATH=/certs/registry.crt \
    --hostname gitlab.example.com \
    --publish 30080:30080 \
    --publish 30022:22 \
    --name gitlab \
    --restart always \
    --volume $(pwd)/config:/etc/gitlab \
    --volume $(pwd)/logs:/var/log/gitlab \
    --volume $(pwd)/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
