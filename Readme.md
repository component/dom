
# dom

  jQuery inspired DOM traversal / manipulation component. Aggregates the
  following components to create a more familiar experience when you need
  the combined functionality of:

  - [domify](http://github.com/component/domify) to convert HTML to DOM nodes
  - [classes](http://github.com/component/classes) to add, remove, and toggle classes

## Installation

```
$ component install component/dom
```

## Example

```js
var dom = require('dom');

dom('li').select(function(el){
  return el.text() == 'Maru';
}).addClass('amazing');
```

## API

  ... not even remotely done ...

## API

   - [dom(id)](#domid)
   - [dom(html)](#domhtml)
   - [.length()](#length)
   - [.get(i)](#geti)
   - [.at(i)](#ati)
   - [.first()](#first)
   - [.last()](#last)
   - [.addClass(name)](#addclassname)
   - [.removeClass(name)](#removeclassname)
   - [.toggleClass(name)](#toggleclassname)
   - [.hasClass(name)](#hasclassname)
   - [.find(selector)](#findselector)
   - [.each(fn)](#eachfn)
   - [.forEach(fn)](#foreachfn)
   - [.map(fn)](#mapfn)
   - [.select(fn)](#selectfn)
   - [.filter(fn)](#filterfn)
   - [.css(prop, value)](#cssprop-value)
   - [.css(prop)](#cssprop)

<a name="domid" />
### dom(id)
should return an element by id.

```js
var list = dom('<ul><li id="one">foo</li><li id="two">bar</li></ul>');
list = dom('#two', list);
assert(1 == list.length(), 'expected length of 1');
assert('bar' == list.get(0).textContent);
```

<a name="domhtml" />
### dom(html)
should return a dom List of elements.

```js
var list = dom('<em>Hello</em>');
assert('Hello' == list.get(0).textContent);
```

<a name="length" />
### .length()
should return the number of elements.

```js
var list = dom('<em>Hello</em>');
assert(1 == list.length());
```

<a name="geti" />
### .get(i)
should return the element at i.

```js
var list = dom('<em>Hello</em>');
assert('Hello' == list.get(0).textContent);
```

<a name="ati" />
### .at(i)
should return the element at i as a List.

```js
var list = dom('<em>Hello</em>');
assert('Hello' == list.at(0).get(0).textContent);
```

<a name="first" />
### .first()
should return the first element in the List.

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');
assert('foo' == list.first().text());
```

<a name="last" />
### .last()
should return the last element in the List.

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');
assert('bar' == list.last().text());
```

<a name="addclassname" />
### .addClass(name)
should add the given class name.

```js
var list = dom('<em>Hello</em>');
list.addClass('foo').addClass('bar');
assert('foo bar' == list.get(0).className);
```

<a name="removeclassname" />
### .removeClass(name)
should remove the given class name.

```js
var list = dom('<em>Hello</em>');
list.addClass('foo').addClass('bar').removeClass('foo');
assert('bar' == list.get(0).className);
```

<a name="toggleclassname" />
### .toggleClass(name)
should toggle the given class name.

```js
var list = dom('<em>Hello</em>');

list.toggleClass('show');
assert('show' == list.get(0).className);

list.toggleClass('show');
assert('' == list.get(0).className);
```

<a name="hasclassname" />
### .hasClass(name)
should return true when the classname is present.

```js
var list = dom('<em>Hello</em>').addClass('show');
assert(true === list.hasClass('show'));
```

should return false when the classname is not present.

```js
var list = dom('<em>Hello</em>').addClass('show');
assert(false === list.hasClass('hide'));
```

<a name="findselector" />
### .find(selector)
should return descendants matching the selector.

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>');
list = list.find('li');
assert(2 == list.length());
```

<a name="eachfn" />
### .each(fn)
should iterate passing (list, i).

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');

var indexes = [];
var values = [];
var ret = list.each(function(el, i){
  indexes.push(i);
  values.push(el);
});

assert(ret == list, 'should return self for chaining');
assert(0 == indexes[0]);
assert(1 == indexes[1]);
assert(values[0] instanceof dom.List, 'values should be dom lists');
assert(list.get(0) == values[0].get(0));
assert(list.get(1) == values[1].get(0));
```

<a name="foreachfn" />
### .forEach(fn)
should iterate passing (el, i).

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');

var indexes = [];
var values = [];
var ret = list.forEach(function(el, i){
  indexes.push(i);
  values.push(el);
});

assert(ret == list, 'should return self for chaining');
assert(0 == indexes[0]);
assert(1 == indexes[1]);
assert(!(values[0] instanceof dom.List), 'values should be elements');
assert(list.get(0) == values[0]);
assert(list.get(1) == values[1]);
```

<a name="mapfn" />
### .map(fn)
should map passing (list, i).

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');

var ret = list.map(function(el, i){
  return el.text();
}).join('|');

assert('foo|bar' == ret);
```

<a name="selectfn" />
### .select(fn)
should filter passing (list, i).

```js
var list = dom('<ul><li>foo</li><li>bar</li></ul>').find('li');

var selected = list.select(function(el){
  return el.text() == 'bar';
});

assert(1 == selected.length(), 'invalid length');
assert(selected.get(0) == list.get(1));
```

<a name="filterfn" />
### .filter(fn)
should alias .select.

```js
assert(dom.List.prototype.filter == dom.List.prototype.select);
```

<a name="cssprop-value" />
### .css(prop, value)
should set a style value.

```js
var list = dom('<em>Hello</em>');
list.css('display', 'none');
assert('none' == list.get(0).style.display);
```

<a name="cssprop" />
### .css(prop)
should get a style value.

```js
var list = dom('<em>Hello</em>');
list.css('display', 'none');
assert('none' == list.css('display'));
```

## Notes

  It is recommended that you do _not_ depend on this library directly
  when creating public components, unless you require most or all of
  the functionality provided. Otherwise it is preferred that you use
  the smaller more specific components.

  This lib will not include _any_ XHR support, that is out of scope,
  this library is for DOM manipulation, traversal, and events only.

## License 

  MIT