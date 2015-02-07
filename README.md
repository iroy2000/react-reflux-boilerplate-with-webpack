# react-reflux-boilerplate-with-webpack

React-Reflux-Boilerplate-with-Webpack is a work flow framework that make life easier for developers by providing a
development and production ready build process framework out of the box. 

    - When you develop, it will immediately shows up in browser without refreshing
    - When you build it, it will optimize JS, HTML and image assets for you ( production ready )
    - Thank you webpack and gulp to make the process painless :)

What is supported  out of the box ?

    - React
    - Reflux ( Refactor of Flux )
    - Jest ( Testing framework for React app )
    - Browser Live Reload
    - CoffeeScript
    - Stylus
    - CSS / HTML / JS minification
    - JS code duplication removal during built
    - Image optimization
    - Optional TDD task to perform auto testing when file changes
    - Please look at the package.json for all installed modules / plugins


### Installation

You must have npm installed gloablly before running the following command. 

```sh
$ npm install
$ npm start
```

Yes, that's it!! You don't like that??  

Now open your broswer and go to 'localhost:8888/' 

### Commands

There are two ways of starting and building, but they are pointing to the same scripts at the end :)

You need to run the following command in the project root, where is the same directoy as package.json

__The Node way__ 

```sh
$ npm start  // start a dev server
$ npm build  // build a production version
$ npm test   // run Jest cli
```

__The Gulp way__

```sh
$ gulp watch  // start a dev server
$ gulp build  // build a production version
$ gulp test   // run test
$ gulp tdd    // start a dev server, watch files and run test
```

Please see __Gotcha__ section if you run into problems :/

### Folder Structure

* src/       - where all the source code live
* assets/    - where all static assets live
* public/    - production level code after you run 'build' command
* \__test\__/  - all your tests go to this directly

__Note__ : assets/ and src/ will be compiled into public/ folder when you run build command


### Suggested Workflow

* After you check out the repo, I will usually do the following
** Run 'gulp watch'  ( or npm start )
** If you prefer TDD, do 'gulp tdd' instead
** Go your browser and go to 'localhost:8888'  ( port is configurable )
** Make code changes
** Watch your code changes reflect on browser without refreshing
** Repeat your development steps
** Run 'gulp build' when you want to generate production level code
** That's very easy, isn't it? 

### Extra Note

If you want to update the npm modules, execute the following commands, it will update all the modules for you.
Be careful though, if your application has dependecies on certain version, it might break your code ~  \o/ Yeah!

```sh
npm install -g npm-check-updates
npm-check-updates -u
```

### Gotcha
There is a tricky part about JEST in node and in gulp.

While using the 'npm test' works fine,  running 'gulp test' will fail because of node harmony flag

So please do yourself a favor by adding the following line to your .profile or .bashrc

```sh
alias gulp='node --harmony `which gulp`'
```

Now it should both works :)

### Todo's
    - Write Tests
