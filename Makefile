all: install

install:
	bundle install --path=vendor/bundle
	mkdir -p var/log

start:
	bundle exec -- unicorn -c unicorn.rb config.ru
