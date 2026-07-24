.PHONY: help update full-update

help:
	@echo AVAILABLE COMMANDS
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-23s\033[0m%s\n", $$1, $$2}'

update: ## Update catalog and app images in docker-compose.yml to specified version
ifndef VERSION
	$(error VERSION is not set)
endif

	@sed -Ei -e 's/(matatika\/catalog:)(\w|\.)*/\1$(VERSION)/g' docker-compose.yml

full-update: update ## Update, commit changes and tag
	@git add docker-compose.yml; git diff-index --quiet HEAD -- docker-compose.yml || git commit -m 'Update image tags to `$(VERSION)`' docker-compose.yml
	@git rev-parse --verify --quiet 'refs/tags/$(VERSION)' > /dev/null || git tag '$(VERSION)'
