SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: up
up:	## start the stack
	docker compose up -d

.PHONY: down
down: ## stop the stack
	docker compose down

.PHONY: bootstrap
bootstrap:	## bootstrap application.
	docker compose exec backend python3 manage.py makemigrations
	docker compose exec backend python3 manage.py migrate
	docker compose exec backend python3 manage.py collectstatic
	docker compose exec backend python3 manage.py createsuperuser
# echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@admin.com', 'admin')"

.PHONY: help
help: ## Show this help.
	@echo "Usage:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help