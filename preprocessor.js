var coffee = require('coffee-script');
var transform = require('coffee-react-transform');

module.exports = {
  process: function(src, path) {
    if (coffee.helpers.isCoffee(path) || (path.match(/\.cjsx/))) {
      return coffee.compile(transform(src), {'bare': true});
    }

    return src;
  }
};
