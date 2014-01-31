default: test
NODE_ENV = test

# Find all coffee files except in node_modules
OBJECTS = $(shell find . ! -path "*/node_modules/*" -type f -name "*.coffee")

test:
	@NODE_ENV=$(NODE_ENV) PORT=3001 mocha \
		--compilers coffee:coffee-script \
		--require test/support/index \
		--timeout 20s \
		test/functional/**/*.coffee \

test-lint:
	@coffeelint $(OBJECTS)

test-all: test-lint test

.PHONY: test test-lint test-all
