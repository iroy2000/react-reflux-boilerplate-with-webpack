var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

var commonLoaders = [
  {test: /.*\.json$/, loader: 'json'},
  {test: /.*\.md$/, loader: 'file'},
  {test: /\.css$/, loader: "style-loader!css-loader" },
  {test: /\.jpe?g$|\.gif$|\.png$|\.svg$|\.woff$|\.ttf$|\.wav$|\.mp3$/, loader: "file-loader"}
];

module.exports = {
  entry: [
    "webpack-dev-server/client?http://0.0.0.0:8888",
    'webpack/hot/only-dev-server',
    './src/scripts/components/router'
  ],
  devtool: "eval",
  debug: true,
  output: {
    path: path.join(__dirname, "public"),
    filename: 'bundle.js'
  },
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new webpack.IgnorePlugin(/vertx/) // https://github.com/webpack/webpack/issues/353
  ],
  resolve: {
    // you can now require('myfile') instead of require('myfile.cjsx')
    extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']
  },
  module: {
    loaders: commonLoaders.concat([
      { test: /\.styl$/, loader: ExtractTextPlugin.extract('style-loader', 'css-loader!stylus')},
      { test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']},
      { test: /\.coffee$/, loader: 'coffee' },
      { test: /\.jsx$|\.js$/, loader: 'jsx-loader?harmony' }
    ])
  }
};
