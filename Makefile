LUA_VER = 5.3

DESTDIR =
INSTALL = install
LUAV = $(subst .,,$(LUA_VER))

LUA_LIB_DIR = $(shell pkg-config --variable=INSTALL_LMOD lua$(LUAV))

TARGET = netstring.lua

.PHONY: all install

all: ;

install: all
	$(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/
	$(INSTALL) $(TARGET) $(DESTDIR)$(LUA_LIB_DIR)/$(TARGET)
