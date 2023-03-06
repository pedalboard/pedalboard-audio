.PHONY: help install restart stop start status sushi-logs

.DEFAULT_GOAL := help

install: ## install the services into the local system
	sudo cp sushi.service /lib/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable sushi

restart: ## restart the services
	sudo systemctl restart sushi

stop: ## stop the services
	sudo systemctl stop sushi

start: ## start the services
	sudo systemctl start sushi

status: ## show the service status
	systemctl status sushi

sushi-logs: ## show log files
	tail -n 100 -f /tmp/sushi.log

enable-ro: ## enable overlay fs
	sudo elk_system_utils --remount-as-ro


disable-ro: ## enable overlay fs
	sudo elk_system_utils  --remount-as-rw

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


