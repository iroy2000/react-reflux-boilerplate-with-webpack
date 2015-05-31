# React Reflux Workflow Boilerplate

"React Reflux Workflow Boilerplate" is a workflow framework that make life easier for developers by providing a development and production ready build process framework out of the box.

## Features

* React
* React Router
* Reflux ( Refactor of Flux )
* ES6 ( Harmony ) | if you use .js or .jsx extension
* CoffeeScript | if you use .coffee extension
* CJSX ( Coffee JSX ) | if you use .cjsx extension
* LoDash  ( Lightweight version of Underscore )
* Stylus ( CSS pre-processor )
* JEET ( Grid system for Stylus )
* Rupture ( Media Query support for Stylus )
* Jest ( Testing framework for React app )
* Browser Live Reload during development
* CSS / HTML / JS minification / Image optimization when built
* JS code duplication removal during built
* Optional TDD task to perform auto testing when file changes

If you are interested, please read the __package.json__ file for all installed modules / plugins.

Feel free to contribute or fork it if you find this repo could help the community.

## Benefits
* During development, it will immediately shows up in browser without refreshing
* When you build it, it will dedub and optimize JS, HTML and image assets for you ( production quality )
* It also comes with TDD option tasks, will run your test whenever you touch your application files
* Minimal setup time and allow you to invest into things that matters
* Everything automatic, you just care about development, nothing else \o/ Yeah ?!

### About the demo code in this repo
Even though this repo is about the workflow boilerplate and how to make your life easier during development,
the React and Reflux demo are also good if you want to learn those technologies. Feel free to send me message or open an issue if you have any questions.

Demo online  http://iroy2000.github.io/

### Installation

You must have npm installed gloablly before running the following command :-

```sh
$ npm install --global gulp
$ npm install
```

__Yes, that's it!!__ You don't like that??

### First Run

```sh
$ gulp dev
```

Then you should see something similar in your terminal

```sh
[23:06:33] Requiring external module coffee-script/register
[23:06:34] Using gulpfile ~/labs/react-reflux-boilerplate-with-webpack/gulpfile.coffee
[23:06:34] Starting 'css'...
[23:06:34] Starting 'copy-assets'...
[23:06:34] Starting 'webpack-dev-server'...
[23:06:34] [webpack-dev-server] http://localhost:8888
[23:06:34] Finished 'webpack-dev-server' after 22 ms
[23:06:35] all files 17.62 kB
[23:06:36] Finished 'css' after 1.39 s
[23:06:36] all files 52.8 kB
[23:06:36] Finished 'copy-assets' after 1.77 s
[23:06:36] Starting 'dev'...
[23:06:36] Finished 'dev' after 8.02 ms

```

Now open your broswer and go to 'localhost:8888/'


### Commands

There are two ways of starting and building, but the Gulp way has more tasks defined :)

You need to run the following command in the project root, where is the same directoy as package.json

__The Node way__

```sh
$ npm start  // start a dev server
$ npm build  // build a production version
$ npm test   // run Jest cli
```

__The Gulp way__

```sh
$ gulp dev  // start a dev server
$ gulp tdd // start a dev server with automatic test running
$ gulp build  // build a production version
$ gulp test   // run test manually
$ gulp clean  // in case you need to clean the public folder
```

Please see __Gotcha__ section if you run into problems :/

### Folder Structure

* src/       - where all the source code live
* assets/    - where all static assets live
* public/    - production level code after you run 'build' command
* \__test\__/  - all your tests go to this directly

__Note__ : assets/ and src/ will be compiled into public/ folder when you run build command


### Suggested Workflow

After you check out the repo, I will usually do the following :-

1. Run 'gulp dev'  ( or npm start )
2. If you prefer TDD, do 'gulp tdd' instead
3. Go your browser and go to 'localhost:8888'  ( port is configurable )
4. Make code changes
5. Watch your code changes reflect on browser without refreshing
6. Repeat your development steps

Once you are ready to deploy, do the following :-

1. Run 'gulp clean' in case your built has old css
2. Run 'gulp build' when you want to generate production level code

That's very easy, isn't it?

### Extra Note

If you want to update the npm modules, execute the following commands, it will update all the modules for you.
Be careful though, if your application has dependencies on certain version, it might break your code ~  \o/ Yeah!

```sh
npm install -g npm-check-updates
npm-check-updates -u
```

If your OS complains cannot find gulp, please try to install gulp globally instead

```sh
npm install --global gulp
```

### Gotcha
1) There is a tricky part about JEST in node and in gulp.

While using the 'npm test' works fine,  running 'gulp test' will fail because of node harmony flag

So please do yourself a favor by adding the following line to your .profile or .bashrc

```sh
alias gulp='node --harmony `which gulp`'
```

Now it should both works :)


2) There is a user reporting when he tries to run the test, he sees an error like the following :-

```sh
[14:03:47] Starting 'test'...
Waiting on 1 test...Segmentation fault
```

If you see this error, seems like it is related to your node version. It is an known issue that Jest doesn't support
React in `NodeJS v0.12.x`.  For more information, you can look at the origin reported issue here :-

https://github.com/iroy2000/react-reflux-boilerplate-with-webpack/issues/4

### WTFPL License
    - Please refer to [WTFPL](http://www.wtfpl.net/ "WTFPL") for more license information.
