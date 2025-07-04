%:
	@:

arg := $(word 2, $(MAKECMDGOALS))
PATH_ARG ?= base64url/tweakdefs8.base64url

.PHONY: install lua

ifeq ($(OS),Windows_NT)
		NODE_PLUGIN_CMD = ""
		NODE_INSTALL_CMD = vfox install nodejs@23
		NODE_USE_CMD = vfox use nodejs@23 --project
else
		NODE_PLUGIN_CMD = asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
		NODE_INSTALL_CMD = asdf install
		NODE_USE_CMD = ""
endif


install:
	$(NODE_INSTALL_CMD)
	$(NODE_USE_CMD)
	npm install -g bun ts-node
	bun install
	bun install -g npm-check-updates

update:
	@bun upgrade
	@bun update -g ts-node
	@npm-check-updates -i
	@bun update

lua:
	@ts-node ./scripts/converter.ts b64tolua

b64-local:
	@ts-node ./scripts/converter.ts luatob64 $(arg)

b64:
ifeq ($(OS),Windows_NT)
	@docker-run.bat $(arg)
else
	@./docker-run.sh $(arg)
endif

clipboard-raw:
	@powershell -Command "Get-Content -Path '$(PATH_ARG)' | Set-Clipboard"
