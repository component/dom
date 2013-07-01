
# dom

  jQuery inspired DOM traversal / manipulation component. Aggregates the
  following components to create a more familiar experience when you need
  the combined functionality of:

  - [domify](http://github.com/component/domify) to convert HTML to DOM nodes
  - [query](http://github.com/component/query) for selector engine integration
  - [classes](http://github.com/component/classes) to add, remove, and toggle classes
  - [delegate](http://github.com/component/delegate) for event delegation
  - [event](http://github.com/component/event) for event binding
  - [value](http://github.com/component/value) for form field values
  - [sort](http://github.com/component/sort) for sorting elements
  - [type](http://github.com/component/type) for type checking
  - [css](http://github.com/component/css) for style properties

## Installation

  With [component](https://github.com/component/component):

```
$ component install component/dom
```

## Stand-alone

  This library may be used stand-alone without the component
  tool, simply add ./dom.js to your application and reference
  the `dom` global. With all its dependencies dom is the following size:

```
   28K  dom.js
   16K  dom.min.js
  8.0K  dom.js.gz
  4.0K  dom.min.js.gz
```

## Example

```js
var dom = require('dom');

dom('li').select(function(el){
  return el.text() == 'Maru';
}).addClass('amazing');
```

## API

  All occurrances of `list` refer to:

  - an element passed
  - a string of html
  - a selector string
  - a node list
  - an array of nodes
  - a dom `List` itself

### dom(list)

  Return a `List` with the given element(s)
  via selector, html, arrays, nodelists, etc.

```js
dom('ul li');
dom(dom('a'));
dom('<p>Hello</p>');
```

### .append(list)

  Append and return `list`:

```js
dom('ul')
  .append('<li>Tobi</li>')
  .addClass('user');
```

### .prepend(list)

  Prepend and return `list`:

```js
dom('ul')
  .prepend('<li>Tobi</li>')
  .addClass('user');
```

### .insertAfter(list)

  Insert after:

```js
dom('<div></div>')
  .insertAfter('body');
```

### .on(event, fn, [capture])

  Bind `event` handler function:

```js
dom('a.remove').on('click', function(e){

});
```

### .on(event, selector, fn, [capture])

  Bind delegate `event` handler function for `selector`:

```js
dom('ul li').on('click', 'a.remove', function(e){

});
```

### .off(event, fn, [capture])

  Unbind `event` callback `fn`.

```js
dom('a.remove').off('click', onremove);
```

### .off(event, selector, fn, [capture])

  Unbind delegate `event` callback `fn` with `selector`.

```js
dom('ul li').off('click', 'a.remove', onremove);
```

### .appendTo(list)

  Append elements in the list to `list`
  and return itself for chaining.

```js
dom('<li>Tobi</li>')
  .appendTo('ul')
  .addClass('user');
```

### .attr(name)

  Return value for attribute `name`:

```js
var url = dom('img').attr('src');
```

### .attr(name, val)

  Set attribute `name` to `val`.

```js
dom('img').attr('src', 'image/of/maru.jpg');
```

### .ATTR()

  Attribute getters. These are functionally equivalent
  to `.attr(ATTR)`:

```js
el.id()
el.src()
el.rel()
el.cols()
el.rows()
el.name()
el.href()
el.title()
el.style()
el.tabindex()
el.placeholder()
```

### .ATTR(val)

  Attribute setters. These are functionally equivalent
  to `.attr(ATTR, val)`:

```js
el.id('item-1')
el.src('some/image.png')
el.rel('stylesheet')
el.cols(2)
el.rows(3)
el.name('username')
el.href('http://google.com')
el.title('Maru the cat')
el.style('color: white')
el.tabindex(2)
el.placeholder('Username')
```

### .css(prop)

  Get css property value:

```js
dom(el).css('width');
```

### .css(prop, val)

  Set css property value:

```js
dom(el).css('width', '300px');
```

### .css(object)

  Set css property values:

```js
dom(el).css({
  top: 5,
  left: 10
});
```

### .addClass(name)

  Add a class `name` to all elements in the list.

```js
dom('img').addClass('loading');
```

### .removeClass(name)

  Remove class `name` to all elements in the list.

```js
dom('img.loading').removeClass('loading');
```

### .toggleClass(name, [bool])

  Toggle class `name`, with optional `bool`.

```js
dom('img').toggleClass('loading');
dom('img').toggleClass('loading', image.pending);
```

### .hasClass(name)

  Check if any element in the list has the given class `name`.

```js
dom('img').hasClass('loading');
```

### .find(selector)

  Return a list of descendants matching `selector`.

```js
dom('.uploads').find('.complete').remove();
```

### .each(fn)

  Iterate elements passing each one as a list, and its index:

```js
dom('ul li').each(function(li, i){
  if (li.hasClass('complete')) {
    li.remove();
  }
});
```

### .empty()

  Empties the elements.

```js
var list = dom('<div><a href="/meow.html">cute kitty</a></div>');
assert('' == list.empty().html());
```

### .forEach(fn)

  Iterate elements passing each one, and its index:

```js
dom('ul li').forEach(function(li, i){
  if (li.className == 'complete') {
    li.parentNode.removeChild(li);
  }
});
```

### .map(fn)

  Return an array with map `fn`, passing each element as a list:

```js
var hrefs = dom('a').forEach(function(a){
  return a.attr('href');
});
```

### .select(fn)

  Filter elements with the given function, passing each element
  as a list. This method is aliased as `.filter(fn)`.

```js
var pending = dom('ul li').select(function(li){
  return li.hasClass('pending');
});
```

### .reject(fn)

  Reject elements with the given function, passing each element
  as a list.

```js
var pending = dom('ul li').reject(function(li){
  return li.hasClass('pending');
});
```

### .first()

  Return a `List` containing the first element:

```js
dom('ul li').first().remove();
```

### .last()

  Return a `List` containing the last element:

```js
dom('ul li').last().remove();
```

### .length()

  Return the number of elements in the list.

### .html()

  Return the inner html.

### .html(str)

  Set the inner html to `str`.

### .text()

  Return the text content.

### .text(str)

  Set text content to `str`.

### .clone()

  Return a cloned list of cloned nodes.

### .get(i)

  Return the `i`th element.

### .at(i)

  Return a `List` containing the `i`th element.

## Enumerable

  This library supports [component/enumerable](http://github.com/component/enumerable), for example:

```js

var _ = require('enumerable')
var dom = require('dom')

var ul = '<ul><li>Tobi</li><li>Loki</li><li>Jane</li></ul>';
var list = dom(ul);

var name = _(list.find('li')).map('text()').first();
assert('Tobi' == name)
```

## Notes

  It is recommended that you do _not_ depend on this library directly
  when creating public components, unless you require most or all of
  the functionality provided. Otherwise it is preferred that you use
  the smaller more specific components.

  This lib will not include _any_ XHR support, js animations, promises, or anything
  else out of scope. This library is for DOM manipulation, traversal, and events only.

  This library is _not_ aiming for feature parity with jQuery.

## License

  MIT
