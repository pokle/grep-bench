
module.exports = function run(callback) {
    if (process.argv.length < 3) {
        console.error("usage: " + process.argv[0] + " TERM Files...");
        process.exit(1);
    }

    process.stdout.bufferSize = 1024

    var term = process.argv[2]
    var files = process.argv.slice(3)

    var grep = function grep(line) {
        if (line.search(term) >= 0) {
            process.stdout.write(line)
            process.stdout.write("\n")
        }
    }

    files.forEach(function processFile(file) {
        callback(file, grep)
    })
}
