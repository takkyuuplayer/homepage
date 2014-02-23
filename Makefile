all: install

install:
	bundle install --path=vendor/bundle
	mkdir -p var/log

start:
	./start.sh

stop:
	kill `cat var/unicorn.pid`
