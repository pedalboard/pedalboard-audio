
install:
	cp sushi.json /etc
	cp sushi.service /etc/systemd/system/
	cp jackd.service /etc/systemd/system/
	systemctl daemon-reload
	systemctl enable jackd
	systemctl enable sushi
	systemctl restart jackd
	systemctl restart sushi