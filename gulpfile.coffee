# gulp modules
gulp = require 'gulp'
gutil = require 'gulp-util'
stylus = require 'gulp-stylus'
minifyHTML = require 'gulp-minify-html'

# gulp filter is optional, in case you need it
gulpFilter = require 'gulp-filter'

# webpack modules
webpack = require 'webpack'
WebpackDevServer = require 'webpack-dev-server'
webpackConfig = require './webpack.config.js'
webpackProductionConfig = require './webpack.production.config.js'

# util
map = require 'map-stream'
touch = require 'touch'
_ = require 'lodash'
nib = require 'nib'

# integrate test and tdd 
jest = require 'jest-cli'

JEST_CONFIG = { 
    rootDir: '.'
    scriptPreprocessor: 'preprocessor.js',
    unmockedModulePathPatterns: ['node_modules/react'],
    testFileExtensions: ['coffee', 'js', 'cjsx'],
    moduleFileExtensions: ['js', 'json', 'coffee', 'cjsx']
}

# your webpack-dev-server port, default 8888
DEV_PORT = '8888'

# Load plugins
$ = require('gulp-load-plugins')()

gulp.task('tdd', (done) ->
  gulp.watch([ JEST_CONFIG.rootDir + "/src/scripts/**/*.cjsx" ], [ 'test' ]);
)

gulp.task('test', (done) ->
  jest.runCLI({ config : JEST_CONFIG }, ".", () ->
    done()
  )
)

# CSS
gulp.task('css', ->
  gulp.src(['src/styles/*.styl'])
    .pipe(stylus({
        use: nib()
        compress: true 
    }))
    .on('error', (err) ->
      gutil.log err
    )
    .pipe($.size())
    .pipe(gulp.dest('public/'))
    .pipe(map((a, cb) ->
      if devServer.invalidate? then devServer.invalidate()
      cb()
    ))
)

# this is for PROD
gulp.task('minify-html', ->
    opts = {comments:true,spare:true}

    gulp.src('assets/**/*.html')
      .pipe(minifyHTML(opts))
      .pipe(gulp.dest('public'))
      .pipe($.size())
)

# this is for PROD
gulp.task('copy-assets-ignore-html', ->
    
    gulp.src(['assets/**', '!assets/**/*.html'])
      .pipe(gulp.dest('public'))
      .pipe($.size())
) 

# this is for DEV
gulp.task('copy-assets', ->
    
    gulp.src(['assets/**'])
      .pipe(gulp.dest('public'))
      .pipe($.size())
)

gulp.task "webpack:build", (callback) ->
  # Run webpack.
  webpack webpackProductionConfig, (err, stats) ->
    throw new gutil.PluginError("webpack:build", err)  if err
    gutil.log "[webpack:build]", stats.toString(colors: true)
    callback()
    return


# Create a single instance of the compiler to allow caching.
devCompiler = webpack(webpackConfig)
gulp.task "webpack:build-dev", (callback) ->

  # Run webpack.
  devCompiler.run (err, stats) ->
    throw new gutil.PluginError("webpack:build-dev", err)  if err
    gutil.log "[webpack:build-dev]", stats.toString(colors: true)
    callback()
    return

  return

devServer = {}
gulp.task "webpack-dev-server", (callback) ->
  # Ensure there's a `./public/main.css` file that can be required.
  touch.sync('./public/main.css', time: new Date(0))

  # Start a webpack-dev-server.
  devServer = new WebpackDevServer(webpack(webpackConfig),
    contentBase: './public/'
    hot: true
    watchDelay: 100
    noInfo: true
  )
  devServer.listen DEV_PORT, "0.0.0.0", (err) ->
    throw new gutil.PluginError("webpack-dev-server", err) if err
    gutil.log "[webpack-dev-server]", "http://localhost:"+DEV_PORT
    callback()

  return

gulp.task 'default', ->
  gulp.start 'build'

gulp.task 'build', ['webpack:build', 'css', 'copy-assets-ignore-html', 'minify-html']

gulp.task 'watch', ['css', 'copy-assets', 'webpack-dev-server'], ->
  gulp.watch(['src/styles/**'], ['css'])
  gulp.watch(['assets/**'], ['copy-assets'])

