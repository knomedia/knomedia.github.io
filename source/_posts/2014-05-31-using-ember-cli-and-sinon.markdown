---
layout: post
title: "Using ember-cli and sinon"
date: 2014-05-31 13:19
comments: false
categories: [ember]
---


So you know and love the idea of [`ember-cli`](http://iamstef/ember-cli). You also want to use [`sinon`](http://sinonjs.org). ember-cli uses [`bower`](http://bower.io) to bring in third party dependencies. At first glance it seems like you could just:

```bash

bower install --save sinon

```

**It doesn't work**. Read along, or watch the video for details on getting sinon and ember-cli to play together.
<div id='videoContent' style="padding-top:20px; padding-bottom:20px;">
  <video controls='controls' poster='http://knomedia.com/blog_assets/2014/web_ember-cli-sinon.jpg' width='700' height='525' >
    <source src='http://knomedia.com/blog_assets/2014/web_ember-cli-sinon.mp4' type='video/mp4' />
  </video>
</div>

### Bring in sinon via bower

Turns out if you check the [github repo for sinon](https://github.com/cjohansen/Sinon.JS), you'll notice that the built
files are not included. Looking at [this comment](https://github.com/cjohansen/Sinon.JS/pull/253#issuecomment-14867326), reveals that the author of sinon would rather not have the built files included in the repo. So fabiosantoscode forked the repo and provides a bower package (`sinonjs-built`) that provides the built files. This works. I don't really care to have all of the repo in this case. I just want to use the sinon built file, the way I would outside of bower... So instead I add sinon to my ember-cli app like so:

```bash

bower install --save sinon=http://sinonjs.org/releases/sinon-1.10.1.js

```

This will bring in sinon and place the file at `vendor/sinon/index.js` within my ember-cli app.

### Include sinon in the broccoli build

ember-cli uses [`brocolli`](https://github.com/broccolijs/broccoli) to build out your ember app. To use sinon we need to make broccoli aware of, and process the sinon files. To do so, we'll need two brocolli plugins. You can install them via [`npm`](https://www.npmjs.org/) like so.

```bash

npm install --save-dev broccoli-static-compiler
npm install --save-dev broccoli-merge-trees

```

[`broccoli-static-compiler`](https://github.com/joliss/broccoli-static-compiler) allows you to pick files out of a tree, and optionally move them. We'll use it to move the `vendor/sinon/index.js` file during the build.

[`broccoli-merge-trees`](https://github.com/broccolijs/broccoli-merge-trees) allows you to merge broccoli trees together. We'll use it to merge the ember app tree and the new sinon tree (of one lonely sinon file).

Now we need to include and use these modules within the `Brocfile.js` that ember-cli builds for you. So add in a require statement for both of them:

```javascript

// Brocfile.js

var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

```

Next lets build a tree for, and move the `sinon` file during the build. Within the `Brocfile.js` still, add:

```javascript
// Brocfile.js

var sinon = pickFiles('vendor/sinon', {
  srcDir: '/',
  files: ['index.js'],
  destDir: '/assets/sinon'
});

```

This tells broccoli to create a tree from `vendor/sinon` and copy the `vendor/sinon/index.js` file to `assets/sinon/index.js` during your build process. Lastly, we need to merge the tree that represents the ember app, and the new tree that we just created for sinon. At the bottom of the `Brocfile.js` replace the existing `module.exports ...` with:

```javascript
// Brocfile.js

module.exports = mergeTrees([app.toTree(), sinon]);

```

### Using sinon in your tests

So we now have sinon included in our app, and build process. Let's use it in a test. The first step is to include it in the `tests/index.html` file. Add a script tag like so:

```html

<script src='assets/sinon/index.js'></script>

```

Now fire up the ember server (`ember serve`) and prove to yourself that sinon is available for your tests by visiting `http://localhost:4200/tests`, open the console and type `sinon`.

Last step. In order to use sinon within your tests, open `tests/.jshintrc` and add sinon to the list of predefined globals. ember-cli executes a JSHint test against each of your files. Trying to use a global (like `sinon`) without including it here will cause a failing test.

You should be good to go. Mock, stub and spy away within your ember-cli tests.
