.PHONY: help install restart stop start status sushi-logs

.DEFAULT_GOAL := help

install: ## install the services into the local system
	systemctl daemon-reload
	systemctl enable sushi

restart: ## restart the services
	systemctl restart sushi

stop: ## stop the services
	systemctl stop sushi

start: ## start the services
	systemctl start sushi

status: ## show the service status
	systemctl status sushi

sushi-logs: ## show log files
	tail -n 100 -f /tmp/sushi.log

enable-ro: ## enable overlay fs
	sudo raspi-config nonint enable_overlayfs

disable-ro: ## enable overlay fs
	sudo raspi-config nonint disable_overlayfs

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


