# TRENDSPACE

## What's this bullshit?

This is the app that powers all that is evil, and that is holy. All that ever was or ever will be. The alpha and the omega. The weak and the mighty. The virgin and the impure. 

All that is TRENDSPACE.

So don't fuck it up.

## I want to change / add something to trendspace.

Cool. Here's what you do. You can pull this code directly to your desktop. Follow the instructions below to get a local environment running. When you've made changes and have verified functionality, submit a pull request. Code changes will be reviewed before being pushed to production to write new tests & ensure all existing tests pass and nothing breaks.

## Running TRENDSPACE locally

1. Install node.js
2. Check out trendbot and install the modules

```bash
git clone git@github.com:forbetaorworse/trend_bot.git
cd trend_bot/
npm install
```

3. Install and configure mongodb and edit config/config.coffee's dev environment to match your local server settings.

4. Start the server

```bash
bin/trendspace
```

## Adding web content

The easiest way to add new pages to TRENDSPACE is to add them to the public folder. Be careful in here. There are still app dependencies that you could impact. Also, the public folder is not a place to keep a slew of files for sharing purposes (music, movies, GIFs, etc).

There is no PHP here. If you want dynamic content, you must utilize express routes.

## CSS with SASS

TRENDSPACE uses SASS for CSS. The .scss files can be found in assets/sass/styles. When a user visits a page and a CSS file is requested, it looks for the coressponding scss file and generates a compiled and minified version that is then delivered to the user.

In order to see CSS changes on SASS files without restarting your local environment, you need to have the grunt watch task running.

```bash
npm install -g grunt
grunt watch
```

## HTML with Handlebars

## Trendbot scripts

## Coding guidelines

1. All code must pass current tests
2. All new code must have new tests