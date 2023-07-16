.PHONY: help install restart stop start status logs

.DEFAULT_GOAL := help

LV2_DIR = /udata/plugins/lv2
METER_PLUGIN = loudness-meter.lv2
REVERB_PLUGIN = DragonflyHallReverb.lv2


install-plugins: ## install required sound plugins
	mkdir -p $(LV2_DIR)
	rm -f $(LV2_DIR)/$(METER_PLUGIN).tgz
	curl -L -o $(LV2_DIR)/$(METER_PLUGIN).tgz https://github.com/pedalboard/$(METER_PLUGIN)/releases/latest/download/$(METER_PLUGIN).tgz  
	cd $(LV2_DIR) && tar -xzvf $(METER_PLUGIN).tgz
	rm $(LV2_DIR)/$(METER_PLUGIN).tgz
	rm -f $(LV2_DIR)/$(REVERB_PLUGIN).tgz
	curl -L -o $(LV2_DIR)/$(REVERB_PLUGIN).tgz https://github.com/pedalboard/dragonfly-reverb/releases/latest/download/$(REVERB_PLUGIN).tgz  
	cd $(LV2_DIR) && tar -xzvf $(REVERB_PLUGIN).tgz
	rm $(LV2_DIR)/$(REVERB_PLUGIN).tgz


install: ## install the services into the local system
	$(MAKE) disable-ro
	sudo cp sushi.service /lib/systemd/system/
	sudo cp connect-midi-apps /usr/bin/
	sudo systemctl daemon-reload
	sudo systemctl enable sushi
	sudo systemctl enable midi-connections
	$(MAKE) enable-ro

restart: ## restart the services
	sudo systemctl stop midi-connections
	sudo systemctl restart sushi
	sudo systemctl start midi-connections

stop: ## stop the services
	sudo systemctl stop sushi
	sudo systemctl stop midi-connections

start: ## start the services
	sudo systemctl start sushi
	sudo systemctl start midi-connections

status: ## show the service status
	@-systemctl status midi-connections
	@-systemctl status sushi

logs: ## show log files
	tail -n 100 -f /tmp/sushi.log

enable-ro: ## enable overlay fs
	sudo elk_system_utils --remount-as-ro


disable-ro: ## enable overlay fs
	sudo elk_system_utils  --remount-as-rw

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


