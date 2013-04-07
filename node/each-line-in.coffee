# By Trevor Burnham 
# http://stackoverflow.com/questions/6319190/iterate-through-lines-in-a-file-with-node-js-and-coffeescript

fs = require 'fs'

module.exports = (filePath, func) ->

  blockSize = 4096
  buffer = new Buffer(blockSize)
  fd = fs.openSync filePath, 'r'
  lastLine = ''

  callback = (err, bytesRead) ->
    throw err if err
    if bytesRead is blockSize
      fs.read fd, buffer, 0, blockSize, null, callback

    lines = buffer.toString('utf8', 0, bytesRead).split '\n'
    lines[0] = lastLine + lines[0]
    [completeLines..., lastLine] = lines
    func(line) for line in completeLines
    return

  fs.read fd, buffer, 0, blockSize, 0, callback
  return
