---
layout: post
author:
    name: Steve Gill
    url: https://twitter.com/stevesgill
title:  "Cordova Plugins Registry goes read-only"
categories: news
tags: announcement
---
Starting today, [plugins.cordova.io](http://plugins.cordova.io) has been swithed to read-only. Plugin authors are encouraged to move their plugins over to [npm](http://npmjs.org) if they haven't already. Plugin authors should checkout our guide to transition over to npm [here](http://plugins.cordova.io/npm/authors.html).

Users can start searching for cordova plugins which have moved over to npm on our new [cordova npm search page](http://plugins.cordova.io/npm/index.html).

Cordova CLI version 5.0.0 or higher is required to fetch plugins from npm. If you want to use the latest releases of plugins, please update your version of Cordova. Alternatively, older cli users can add plugins via git urls. Example:

    cordova plugin add https://github.com/apache/cordova-plugin-camera.git
