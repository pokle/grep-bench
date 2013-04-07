#!/usr/bin/env node

// Peaks at 15mb/sec 100% cpu
var harness = require(__dirname + '/harness')
var lineReader = require("line-reader")

harness(function(file, grep){
    lineReader.eachLine(file, grep)
})
