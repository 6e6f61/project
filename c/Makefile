OUT=project-name
SRC=$(wildcard lib/*.c src/*.c)
HEADERS=$(wildcard lib/*.h)
OBJ=$(patsubst src/%.c, build/%.o, $(SRC))
LIBS=#$(shell pkg-config --libs xyz)
CFLAGS=\
	-std=c11 \
	-pedantic -Wall \
	-O2 \
	-Ilib

.PHONY: install

$(OUT): $(OBJ)
	cc -o $@ $^ $(LIBS) $(CFLAGS)

build/%.o: src/%.c $(HEADERS)
	-@mkdir build
	cc -c -o $@ $< $(CFLAGS)
