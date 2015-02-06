# react-reflux-boilerplate-with-webpack

React-Reflux-Boilerplate-with-Webpack is a work flow framework that make life easy for developers by providing a
development and production ready build process framework out of the box. 

    - When you develop, it will immediately shows up browser without refreshing
    - When you build it, it will optimize JS, HTML and image assets for you
    - Thank you webpack and gulp to make the process painless :)

What is supported  out of the box ?
    - React
    - Reflux ( Refactor of Flux )
    - Jest ( Testing framework for React app )
    - Browser Live Reload
    - CoffeeScript
    - Stylus
    - CSS / HTML / JS minification
    - Image optimization
    - Please look at the package.json for all installed modules / plugins


### Installation

You must have npm installed gloablly before running the following command. 

```sh
$ npm install
```

Yes, that's it!! You don't like that??

### Commands

There are two ways of starting and building, but they are pointing to the same scripts at the end :)

You need to run the following command in the project root, where is the same directoy as package.json

The Node way 

```sh
$ npm start  // start a dev server
$ npm build  // build a production version
$ npm test   // run Jest cli
```

The Gulp way

```sh
$ gulp watch  // start a dev server
$ gulp build  // build a production version
```

### Folder Structure

* src/       - where all the source code live
* assets/    - where all static assets live
* public/    - production level code after you run 'build' command
* __test__/  - all your tests go to this directly

### Todo's
    - Write Tests
