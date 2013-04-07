#!/usr/bin/env node

require('coffee-script')

// 36mb/sec.
var harness = require(__dirname + '/harness')
var eachLineIn = require(__dirname + '/each-line-in.coffee')

harness(function(file, grep){
    eachLineIn(file, grep)
})
