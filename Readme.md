
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

## Notes

  It is recommended that you do _not_ depend on this library directly
  when creating public components, unless you require most or all of
  the functionality provided. Otherwise it is preferred that you use
  the smaller more specific components.

## License 

  MIT