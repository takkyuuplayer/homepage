all: install

install:
	bundle install
	mkdir -p var/log
	cd ./etc/deploy && bundle install

start:
	bundle exec -- unicorn -c unicorn.rb config.ru
