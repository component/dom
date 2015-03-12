
1.0.7 / 2015-03-11
==================

  * inline `isArray()` for now
  * component: update "classes" and "to-function" deps
  * component: update "domify" to v1.3.2
  * package: add browserify support
  * package: add "keywords" array

1.0.6 / 2014-08-29
==================

  * update multiple deps [#81](https://github.com/component/dom/pull/81)
  * fix undefined dom in .react [#74](https://github.com/component/dom/pull/74)

1.0.5 / 2014-03-27
==================

  * update domify
  * Update matthewp/keys

1.0.4 / 2014-02-28
==================

  * update component/delegate to 0.2.1

1.0.3 / 2014-02-27
==================

  * cmp: bump 1.0.3
  * cmp: bump to-function@2.0.0

1.0.2 / 2014-02-26
==================

  * cmp: bump each@0.2.2

1.0.1 / 2014-02-05
==================

  * pin component/to-function

1.0.0 / 2014-02-04
==================

  * BREAKING: Use an array-like object (like jquery) & reorganize project.
  * add: dom.use(fn) to support plugins
  * add: .replace()
  * fix: .html() return value of self
  * add: trimming html on initial to clean up messy html
  * fix: insertAfter on a NodeList

0.9.0 / 2013-08-03
==================

  * add "action" and "method" to attr shorthand methods
  * add `.parent([selector])`
  * add `.parents([selector])`
  * add `.next([selector])`
  * add `.prev([selector]])`
  * add `.is(selector)`

0.8.0 / 2013-07-01
==================

  * add .insertAfter()
  * add "type" attribute

0.7.1 / 2013-06-18
==================

  * add .reject()
  * pin deps

0.7.0 / 2013-05-27
==================

  * add .removeAttr(name)

0.6.0 / 2013-04-24
==================

  * add Enumerable iterator support. Closes #35

0.5.0 / 2013-04-14
==================

  * add .value([val])

0.4.0 / 2013-03-14
==================

  * add query dep for `.find()`
  * add `.empty()`

0.3.0 / 2013-03-13
==================

  * add component/css support. Closes #29
  * add `dom.js` build target

0.2.0 / 2013-02-23
==================

  * add event delegation example
  * add manipulation example
  * add initial .remove() implementation
  * add .text(str) tmp implementation
  * add `.prop()` method
  * add `.get()` == `.get(0)`
  * add `.appendTo()`
  * add `.removeClass(regexp)` support
  * add `.css(object)` support
  * change .append() and .prepend() to return new list
  * change `.attr()` to set attribute for each element

0.1.0 / 2013-01-04
==================

  * add .toggleClass(name, bool) support
  * fix for latest domify()
