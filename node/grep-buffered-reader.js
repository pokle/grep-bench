#!/usr/bin/env node

// 2mb/sec!!!

var harness = require(__dirname + '/harness')
var reader = require ("buffered-reader");
var DataReader = reader.DataReader;

harness(function(file, grep){
    new DataReader (file, { encoding: "utf8" })
        .on ("line", grep)
        .read()
})

