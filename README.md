Grep bench
==========

This is a simple data processing Benchmark. Write the fastest 'grep' command in your favourite language, and send me a pull request. This is a benchmark of streaming text IO, so a simple substring match is sufficient. Don't worry with regular expressions.

Here's some psuedo code:

	while there are lines to read
		print the line if it contains the search term


What's the point?
=================
Typically data processing often involves reading through text files such as CSV, XML, LDIF, MAIL, Apache log files, etc. Most of these are read line by line, and some translation and filter operations are applied. These tasks are not typically CPU bound. They tend to be IO bound.

I've found through trial and error that not all languages are made the same when it comes to IO. And this benchmark is a way to illustrate this.

Results
=======

2013-10-15 Macbook Pro 2.7ghz 16gb ram SSD

- C: 21 seconds, 398 MB/sec
- C++: 30 seconds, 277 MB/sec
- Clojure: 302 seconds, 27 MB/sec

