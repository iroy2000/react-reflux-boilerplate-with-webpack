var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var DEFAULT_IMG_OPT_STRING = 'image?bypassOnDebug&optimizationLevel=7';
var DEFAULT_FILE_LOADER_STRING = 'file?hash=sha512&digest=hex&name=assets/[hash].[ext]';

var commonLoaders = [
  {test: /\.(png|svg)$/i, loaders: [DEFAULT_FILE_LOADER_STRING, DEFAULT_IMG_OPT_STRING + '&interlaced=true']},
  {test: /\.(gif)$/i, loaders: [DEFAULT_FILE_LOADER_STRING, DEFAULT_IMG_OPT_STRING     + '&interlaced=false']},
  {test: /\.(jpe?g)$/i, loaders: [DEFAULT_FILE_LOADER_STRING, DEFAULT_IMG_OPT_STRING   + '&interlaced=false&progressive=true']},
  {test: /\.css$/, loader: "style-loader!css-loader" }
];

module.exports = {
  entry: {
    app: [
      './src/scripts/components/router'
    ]
  },
  devtool: 'source-map',
  output: {
      path: path.join(__dirname, "public"),
      filename: "bundle.js"
  },
  resolveLoader: {
    modulesDirectories: ['..', 'node_modules']
  },
  plugins: [
    new webpack.DefinePlugin({
      // This has effect on the react lib size.
      "process.env": {
        NODE_ENV: JSON.stringify("production")
      }
    }),
    new webpack.IgnorePlugin(/vertx/),
    new webpack.IgnorePlugin(/un~$/),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin()
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
