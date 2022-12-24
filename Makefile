
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

stop:
	systemctl stop jackd
	systemctl stop sushi

start:
	systemctl start jackd
	systemctl start sushi

status:
	systemctl status jackd
	systemctl status sushi

sushi-logs:
	tail -n 100 -f /var/log/sushi.log
