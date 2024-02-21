.PHONY: all help pre-commit migrate

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

initialize: application certs
	@sudo ./docs/infra/local/scripts/hosts.sh
	@yarn install

application:
	@brew install mkcert nss traefik node watchman || true
	@npm install -g yarn || true

# install
certs:
	@mkcert -install
	@rm -rf docs/infra/local/cert && mkdir docs/infra/local/cert
	@cd docs/infra/local/cert && mkcert a.com '*.a.com'
