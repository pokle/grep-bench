all: bin/cgrep bin/cppgrep

clean:
	rm -rf bin

bin:
	mkdir bin

bin/cgrep: bin c/cgrep.c
	$(CC) c/cgrep.c -o bin/cgrep

bin/cppgrep: bin cpp/cppgrep.cc
	c++ cpp/cppgrep.cc -o bin/cppgrep
