
build: index.js components
	@component build --dev

components: component.json
	@component install --dev

clean:
	@rm -fr build components dom.*.js dom*.gz

node_modules: package.json
	@npm install

test-browser: node_modules build
	@./node_modules/.bin/component-test browser

test: node_modules build
	@./node_modules/.bin/component-test phantom

dom.js: index.js components
	@component build --standalone dom --out . --name dom

dom.js.gz: dom.js
	@zopfli -c $< > $@

dom.min.js: dom.js
	@uglifyjs $< > $@

dom.min.js.gz: dom.min.js
	@zopfli -c $< > $@

stats: dom.js dom.min.js dom.js.gz dom.min.js.gz
	@du -h $^

.PHONY: build clean test stats
