# Copyright 2018-2022 Richard Lincoln. All rights reserved.

PROJECTDIR = $(PWD)

F2CDIR = $(PROJECTDIR)/third_party/f2c-20160102
LIBF2CDIR = $(PROJECTDIR)/third_party/libf2c2-20130926
FORT77DIR = $(PROJECTDIR)/third_party/fort77-1.15

LAPACKDIR = $(PROJECTDIR)/third_party/lapack-3.4.2
PCREDIR = $(PROJECTDIR)/third_party/pcre-8.43
SUITESPARSEDIR = $(PROJECTDIR)/third_party/suitesparse-5.4.0
OCTAVEDIR = $(PROJECTDIR)/third_party/octave-4.4.1

INSTALLDIR = $(PROJECTDIR)/target
BINDIR = $(INSTALLDIR)/bin
LIBDIR = $(INSTALLDIR)/lib
INCDIR = $(INSTALLDIR)/include
SRCDIR = $(PROJECTDIR)/src

JOBS = 4

all: $(INSTALLDIR)/worker/octave.js


# F2C

$(F2CDIR)/src/f2c: $(F2CDIR)/src/*.c
	make -C $(F2CDIR) -j$(JOBS) all

$(BINDIR)/f2c: $(F2CDIR)/src/f2c $(BINDIR)
	cp $< $@


# LIBF2C

$(LIBF2CDIR)/libf2c.so: $(LIBF2CDIR)/*.c
	emmake make -C $(LIBF2CDIR) -j$(JOBS) all libf2c.so

$(LIBDIR)/libf2c.so: $(LIBF2CDIR)/libf2c.so $(LIBDIR)
	cp $< $@

$(INCDIR)/f2c.h: $(LIBF2CDIR)/f2c.h0 $(INCDIR)
	cp $< $@


# FORT77

$(FORT77DIR)/fort77: $(FORT77DIR)/*.in
	emmake make -C $(FORT77DIR) F2C=$(BINDIR)/f2c fort77

$(BINDIR)/fort77: $(FORT77DIR)/fort77 $(BINDIR)
	cp $< $@


# LAPACK

$(LAPACKDIR)/librefblas.so:
	emmake make -C $(LAPACKDIR) -j$(JOBS) F77=$(BINDIR)/fort77 INCDIR=$(INCDIR) blaslib

$(LIBDIR)/librefblas.so: $(LAPACKDIR)/librefblas.so $(LIBDIR)
	cp $< $@

$(LAPACKDIR)/libclapack.so:
	emmake make -C $(LAPACKDIR) -j$(JOBS) F77=$(BINDIR)/fort77 INCDIR=$(INCDIR) lapacklib

$(LIBDIR)/libclapack.so: $(LAPACKDIR)/libclapack.so $(LIBDIR)
	cp $< $@


# PCRE

$(PCREDIR)/.libs/libpcre.so: $(PCREDIR)/*.c
	cd $(PCREDIR); autoreconf -f -i; emconfigure ./configure CFLAGS="-s LINKABLE=1 -s EXPORT_ALL=1 -O0" --prefix=$(INSTALLDIR) --disable-static

$(LIBDIR)/libpcre.so: $(PCREDIR)/.libs/libpcre.so
	CC=emcc make -C $(PCREDIR) install

#$(LIBDIR)/libpcre.so:
#	mkdir -p $(PCREDIR)/build; cd $(PCREDIR)/build; \
#	CC=emcc CXX=em++ AR=emar RANLIB=emranlib cmake .. \
#		-DCMAKE_INSTALL_PREFIX=$(INSTALLDIR) \
#		-DBUILD_SHARED_LIBS=ON -DPCRE_BUILD_PCREGREP=OFF -DPCRE_BUILD_TESTS=OFF; \
#	make -j$(JOBS) install


# SUITESPARSE

$(LIBDIR)/libumfpack.so: $(BINDIR)/fort77 $(LIBDIR)/librefblas.so $(LIBDIR)/libclapack.so
	emmake make -C $(SUITESPARSEDIR) INSTALL=$(INSTALLDIR) JOBS=$(JOBS) OPTIMIZATION=-O0 AUTOCC=no \
	F77=$(BINDIR)/fort77 BLAS=-lrefblas LAPACK=-lclapack RANLIB=emranlib config install


# OCTAVE

ERROR_ON_UNDEFINED_SYMBOLS = 0

$(LIBDIR)/octave/4.4.1/liboctave.so: $(BINDIR)/f2c $(LIBDIR)/libf2c.so $(INCDIR)/f2c.h $(BINDIR)/fort77 $(LIBDIR)/librefblas.so $(LIBDIR)/libclapack.so $(LIBDIR)/libpcre.so $(LIBDIR)/libumfpack.so
	rm -f $(OCTAVEDIR)/configure
	cd $(OCTAVEDIR); autoreconf
#	cd $(OCTAVEDIR); rm -f config.cache config.log config.status

	# Manually set FORTRAN name-mangling to use lower-case and single underscore.
	sed -i -e 's/(name,NAME) name"/(name,NAME) name ## _"/g' $(OCTAVEDIR)/configure

	cd $(OCTAVEDIR); emconfigure ./configure \
F77=$(BINDIR)/fort77 \
CC=emcc \
CXX=em++ \
AR=emar \
RANLIB=emranlib \
CFLAGS="-I$(INCDIR) -O0" \
CXXFLAGS="-std=c++11 -I$(INCDIR) -O0" \
FFLAGS="-I$(INCDIR) -O0" \
FLIBS="" \
LDFLAGS="-s ERROR_ON_UNDEFINED_SYMBOLS=$(ERROR_ON_UNDEFINED_SYMBOLS) -L$(LIBDIR) -O0" \
EMCC_FORCE_STDLIBS=1 \
EMCONFIGURE_JS=1 \
BUILD_EXEEXT=.js \
--prefix=$(INSTALLDIR) \
--enable-shared --enable-dl --disable-static \
--disable-threads --disable-openmp \
--without-qt --disable-java --enable-fortran-calling-convention=f2c --disable-cross-tools \
--disable-readline --disable-64 --disable-docs --without-curl --without-fftw3 \
--without-fftw3f --without-hdf5 --without-opengl --without-qrupdate --without-framework-carbon --without-framework-opengl --without-x \
--without-arpack --with-blas=-lrefblas --with-lapack=-lclapack \
--with-pcre-includedir=$(INCDIR) --with-pcre-libdir=$(LIBDIR) --without-cholmod --without-cxsparse

	#emmake make -C $(OCTAVEDIR) -j$(JOBS)
	emmake make -C $(OCTAVEDIR)
	emmake make -C $(OCTAVEDIR) install


# Main

$(INSTALLDIR)/worker/octave.js: $(LIBDIR)/octave/4.4.1/liboctave.so
	make -C $(SRCDIR) PREFIX=$(INSTALLDIR) worker/octave.js

$(INSTALLDIR)/node/octave.js: $(LIBDIR)/octave/4.4.1/liboctave.so
	make -C $(SRCDIR) PREFIX=$(INSTALLDIR) node/octave.js


$(BINDIR):
	mkdir -p $(BINDIR)
$(INCDIR):
	mkdir -p $(INCDIR)
$(LIBDIR):
	mkdir -p $(LIBDIR)


uninstall:
	rm -f $(BINDIR)/f2c
	rm -f $(BINDIR)/fort77
	rm -f $(LIBDIR)/librefblas.*
	rm -f $(LIBDIR)/libf2c.so
	rm -f $(LIBDIR)/libclapack.*
	-cd $(PCREDIR); make uninstall
	cd $(SUITESPARSEDIR); make uninstall
	-cd $(OCTAVEDIR); make uninstall

clean:
	cd $(F2CDIR); make clean
	cd $(LIBF2CDIR); make clean
	cd $(FORT77DIR); make clean
	cd $(LAPACKDIR); make clean
	-cd $(PCREDIR); make clean
	cd $(SUITESPARSEDIR); make clean
	-cd $(OCTAVEDIR); make clean
	cd $(SRCDIR); make clean

distclean: clean
	cd $(F2CDIR); make distclean
	cd $(FORT77DIR); make distclean


IMAGE_TAG = ghcr.io/rwl/octave-wasm:latest
TARGET = builder
CMD =

.PHONY: build
build:
	docker build --target $(TARGET) -t $(IMAGE_TAG) .

.PHONY: run
run:
	docker run -it --rm -p 8080:8080 -v `pwd`/src/index.html:/usr/src/octave-wasm/src/index.html $(IMAGE_TAG) $(CMD)

.PHONY: dev
dev:
	docker run -it -p 8080:8080 -v `pwd`:/usr/src/octave-wasm -w /usr/src/octave-wasm --user `id -u`:`id -g` $(IMAGE_TAG) bash
