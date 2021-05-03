LUASTATIC ?= luastatic
LUA ?= lua5.1
LUA_INCLUDE ?= /usr/include/$(LUA)

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

luarun: 
	$(LUASTATIC) luarun.lua -l$(LUA) -I$(LUA_INCLUDE)
	@strip luarun

install:
	install -Dm775 luarun $(DESTDIR)$(BINDIR)/luarun

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)/luarun

clean:
	rm -rf luarun.luastatic.c
	rm -rf luarun

.PHONY: luarun