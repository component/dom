
build: index.js components
	@component build --dev

components:
	@component install --dev

clean:
	rm -fr build components

test:
	@mocha-phantomjs -R dot test/index.html

dom.js:
	@component build --standalone dom --out . --name dom

.PHONY: clean test
