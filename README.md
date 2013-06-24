streaming-io-language-bench
===========================

How good are programming languages at processing large quantities of text data?

This problem has been brewing for a long time. Most places I've worked have had large amounts of data in plain text newline delimited format. Like CSV files, or Apache log files. Most of the work involved either converting formats, loading them up into databases for further analysis, or reporting straight off the files.

Quite early on I realised that my go to language for processing these files was quick - Perl. But not as quick as C. Other languages such as Ruby were horrible and were to be avoided. Perl wasn't as fast as C, but it was good enough. 

Disk IO wasn't that amazing back then. You could use a slow language, and still come up ahead.

Then something changed. There are SSDs everywhere. All of a sudden I'm finding that my processing scripts are CPU bound, and the SSDs are being hardly used to their full bandwidth. There's an opportunity here - to speed up processing.

Source of data
==============
http://haselgrove.id.au/wikipedia.htm