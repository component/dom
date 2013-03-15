
build: index.js components
	@component build --dev

components:
	@component install --dev

clean:
	rm -fr build components dom.*.js dom*.gz

test:
	@mocha-phantomjs -R dot test/index.html

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

.PHONY: clean test stats
