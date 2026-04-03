# ShellTunes Makefile
CC = gcc
CFLAGS = -Wall -Wextra -O2 -pthread
LDFLAGS = -lncurses -pthread

TARGET = bin/shelltunes
SRC = $(wildcard src/*.c)

.PHONY: all clean install uninstall debug

all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p bin
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

debug: $(SRC)
	@mkdir -p bin
	$(CC) $(CFLAGS) -g -DDEBUG -o $(TARGET) $^ $(LDFLAGS)

clean:
	rm -f $(TARGET)

install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin/shelltunes

uninstall:
	rm -f /usr/local/bin/shelltunes
