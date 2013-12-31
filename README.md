Grep bench
==========

This is a simple data processing Benchmark. Write the fastest 'grep' command in your favourite language, and send me a pull request. This is a benchmark of streaming text IO, so a simple substring match is sufficient. Don't worry with regular expressions.

Here's some psuedo code:

	while there are lines to read
		print the line if it contains the search term


What's the point?
=================
Typically data processing often involves reading through text files such as CSV, XML, LDIF, MAIL, Apache log files, etc. Most of these are read line by line, and some translation and filter operations are applied. These tasks are not typically CPU bound. 

These tasks tend to be IO bound. With fast SSDs and memory, IO is not a slouch any more in 2013. Your favourite language's IO subsystem is :-)


Results
=======

2013-10-15 Macbook Pro 2.7ghz 16gb ram SSD

- C: 21 seconds, 398 MB/sec
- C++: 30 seconds, 277 MB/sec
- Clojure: 302 seconds, 27 MB/sec

<img src="https://docs.google.com/spreadsheet/oimg?key=0An25T1C0eQDYdHBCTHJFbWJ5U2lZTC1STk5lMmwzbGc&oid=1&zx=oy1n0k4owqhy" />


Contributing
============

Before you can run a benchmark, or write your own, you'll need some data.

	$ make data

This creates a large file called data/haystack. It contains one needle per gigabyte. Here's how to run the C version of the benchmark:

	$ make
	...
	$ time ./bin/cgrep needle data/haystack
	A very fine needle.
	A very fine needle.
	A very fine needle.
	A very fine needle.
	A very fine needle.
	A very fine needle.
	A very fine needle.
	A very fine needle.
	       20.63 real        18.64 user         1.98 sys

Running your programs through this file tends to stress just input. It's a great way to understand input performance in isolation.

On my 400MB/sec SSD Macbook Pro, I get:



- C: 21 seconds, 398 MB/sec
- C++: 30 seconds, 277 MB/sec
- Clojure: 302 seconds, 27 MB/sec

Lets try and generate output at the same time (albeit discarding it):

	$ time ./bin/cgrep hay data/haystack > /dev/null
			15.92 real        13.87 user         2.04 sys

And something really weird happens! It gets faster!


Lets try Clojure
================

First lets see what the overhead is of just starting up the JVM:

	$ cd clojure
	$ time lein run root /etc/passwd > /dev/null
	        2.76 real         4.61 user         0.27 sys

And now lets search for the needles:

	$ time lein run needle ../data/haystack 
	A very fine needle.
	...
	      300.75 real       302.16 user         5.33 sys

And how about the hay?

	$ time lein run hay ../data/haystack > /dev/null 
	      780.61 real       971.65 user       512.96 sys

Whoa! Someone from the Clojure camp please help!
