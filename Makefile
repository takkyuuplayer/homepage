all: setup

setup:
	bundle install
	bundle update
	mkdir -p var/log
	cd ./etc/deploy && $(MAKE) setup

start:
	bundle exec -- unicorn -c unicorn.rb config.ru
