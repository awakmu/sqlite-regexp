SOURCES = regexp.c
OBJECTS = $(SOURCES:.c=.o)
EXTENSIONS = regexp.sqlext

LDFLAGS ?= -Wl,-O5,--as-needed
CFLAGS ?= -O3 -pipe

CFLAGS += -fPIC -Isqlite3 -Wall
LIBS = -lpcre

.PHONY: all clean

all: regexp.sqlext

regexp.sqlext: $(OBJECTS)
	$(CC) -shared -fPIC $(CFLAGS) $(LDFLAGS) -o $@ $<

clean:
	$(RM) $(OBJECTS) $(EXTENSIONS)