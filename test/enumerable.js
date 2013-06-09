
var assert = require('assert')
  , _ = require('enumerable')
  , dom = require('dom')

describe('List', function(){
  it('should be enumerable', function(){
    var ul = '<ul><li>Tobi</li><li>Loki</li><li>Jane</li></ul>';
    var list = dom(ul);

    var name = _(list.find('li')).map('text()').first();
    assert('Tobi' == name)

    var name = _(list.find('li')).map('text()').last();
    assert('Jane' == name)
  })
})
