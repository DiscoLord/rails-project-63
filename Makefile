# Makefile

install:
	bundle install
lint:
	bundle exec rubocop
lintfix:
	bundle exec rubocop -a