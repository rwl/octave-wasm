PREFIX=$(DESTDIR)/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1
VERSION=1.15
DISTFILES= Makefile fort77.1 tests/baz/bazfoo.f tests/test.pl \
	tests/mainmiss.f tests/foo.f tests/long.c tests/long.f tests/synerr.f \
	tests/bar.F tests/ishift.f fort77-1.15.lsm  fort77.in \
	configure configure.in

fort77: fort77.in configure
	./configure

configure: configure.in
	autoconf

test: fort77
	(cd tests; ./test.pl -v)

install: test
	install -m 755 fort77 $(BINDIR)
	install -m 644 fort77.1 $(MANDIR)

clean:
	rm -f *~ *.bak *.o core */*~ */*.bak */*.o */core fort77 

distclean: clean
	rm -f config.cache config.log config.status

maintainer-clean: distclean
	rm -f configure
	
dist: $(DISTFILES)
	(cd ..; tar cf - `for a in $(DISTFILES); do echo fort77-$(VERSION)/$$a; done` | gzip -9 > fort77-$(VERSION).tar.gz )
