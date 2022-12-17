
install:
	cp sushi.json /etc
	cp sushi.service /etc/systemd/system/
	cp jackd.service /etc/systemd/system/
	systemctl daemon-reload
	systemctl enable jackd
	systemctl enable sushi

restart:
	systemctl restart jackd
	systemctl restart sushi

status:
	systemctl status jackd
	systemctl status sushi

sushi-logs:
	cat /var/log/sushi.log
