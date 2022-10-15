FROM ubuntu:focal as builder

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
	build-essential autoconf automake libtool cmake file texinfo flex librsvg2-bin icoutils \
	python ca-certificates git openjdk-11-jre curl nano unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/emscripten-core/emsdk.git /usr/src/emsdk
WORKDIR /usr/src/emsdk

#RUN ./emsdk list
#RUN ./emsdk install latest  # --no-cache
#RUN ./emsdk activate latest
#RUN sh ./emsdk_env.sh

RUN git fetch
#RUN git checkout 3.1.24
#RUN git checkout 1.40.1
RUN git checkout c10e3e86e8ead9243473c7148beaa9261956123b
RUN ./emsdk install sdk-1.38.30-64bit
RUN ./emsdk activate sdk-1.38.30-64bit

#ENV EMSDK_VER 3.1.24
#ENV NODE_VER 14.18.2
#ENV EMSDK_VER 1.40.1
#ENV NODE_VER 12.18.1

#RUN ./emsdk install $EMSDK_VER
#RUN ./emsdk activate $EMSDK_VER
#
#ENV PATH="/usr/src/emsdk:/usr/src/emsdk/upstream/emscripten:/usr/src/emsdk/node/${NODE_VER}_64bit/bin:${PATH}"
#ENV EMSDK /usr/src/emsdk
#ENV EM_CONFIG /usr/src/emsdk/.emscripten
#ENV EM_CACHE /usr/src/emsdk/upstream/emscripten/cache
#ENV EMSDK_NODE /usr/src/emsdk/node/${NODE_VER}_64bit/bin/node


#RUN bash -c "source ./emsdk_env.sh"

ENV PATH="/usr/src/emsdk:/usr/src/emsdk/clang/e1.38.30_64bit:/usr/src/emsdk/node/8.9.1_64bit/bin:/usr/src/emsdk/emscripten/1.38.30:${PATH}"
ENV EMSDK /usr/src/emsdk
ENV EM_CONFIG /root/.emscripten
ENV LLVM_ROOT /usr/src/emsdk/clang/e1.38.30_64bit
ENV EMSCRIPTEN_NATIVE_OPTIMIZER /usr/src/emsdk/clang/e1.38.30_64bit/optimizer
ENV BINARYEN_ROOT /usr/src/emsdk/clang/e1.38.30_64bit/binaryen
ENV EMSDK_NODE /usr/src/emsdk/node/8.9.1_64bit/bin/node
ENV EMSCRIPTEN /usr/src/emsdk/emscripten/1.38.30

RUN emcc -v


ENV PROJECTDIR /usr/src/octave-wasm
ENV THIRDPARTYDIR $PROJECTDIR/third_party
ENV INSTALLDIR $PROJECTDIR/target
ENV BINDIR $INSTALLDIR/bin
ENV INCDIR $INSTALLDIR/include
ENV LIBDIR $INSTALLDIR/lib

WORKDIR $PROJECTDIR
RUN mkdir -p $BINDIR $INCDIR $LIBDIR
#COPY Makefile $PROJECTDIR/Makefile

#FROM scratch as server

COPY third_party/f2c-20160102 $THIRDPARTYDIR/f2c-20160102
#RUN make $BINDIR/f2c
RUN cd $THIRDPARTYDIR/f2c-20160102 && \
    make -j${JOBS:-4} all && \
    cp src/f2c $BINDIR


COPY third_party/libf2c2-20130926 $THIRDPARTYDIR/libf2c2-20130926
#RUN make $LIBDIR/libf2c.so $INCDIR/f2c.h
RUN cd $THIRDPARTYDIR/libf2c2-20130926 && \
    emmake make -j${JOBS:-4} all libf2c.so && \
    cp libf2c.so $LIBDIR && \
    cp f2c.h0 $INCDIR/f2c.h


COPY third_party/fort77-1.15 $THIRDPARTYDIR/fort77-1.15
#RUN make $BINDIR/fort77
RUN cd $THIRDPARTYDIR/fort77-1.15 && \
    emmake make F2C=$BINDIR/f2c fort77 && \
    cp fort77 $BINDIR


COPY third_party/lapack-3.4.2 $THIRDPARTYDIR/lapack-3.4.2
#RUN make $LIBDIR/librefblas.so
#RUN make $LIBDIR/libclapack.so
RUN cd $THIRDPARTYDIR/lapack-3.4.2 && \
    emmake make -j${JOBS:-4} F77=$BINDIR/fort77 INCDIR=$INCDIR blaslib && \
    cp librefblas.so $LIBDIR
RUN cd $THIRDPARTYDIR/lapack-3.4.2 && \
    emmake make -j${JOBS:-4} F77=$BINDIR/fort77 INCDIR=$INCDIR lapacklib && \
    cp libclapack.so $LIBDIR


COPY third_party/pcre-8.43 $THIRDPARTYDIR/pcre-8.43
#RUN make $LIBDIR/libpcre.so
RUN cd $THIRDPARTYDIR/pcre-8.43 && \
    autoreconf -f -i && \
    emconfigure ./configure CFLAGS="-O0" --prefix=$INSTALLDIR --disable-static && \
    emmake make install


COPY third_party/suitesparse-5.4.0 $THIRDPARTYDIR/suitesparse-5.4.0
#RUN make $LIBDIR/libumfpack.so
RUN cd $THIRDPARTYDIR/suitesparse-5.4.0 && \
    emmake make INSTALL=$INSTALLDIR JOBS=${SSJOBS:-1} OPTIMIZATION=-O0 AUTOCC=no \
    F77=$BINDIR/fort77 BLAS=-lrefblas LAPACK=-lclapack RANLIB=emranlib config install


RUN ls -alh /usr/src/octave-wasm/target/lib

COPY third_party/octave-4.4.1 $THIRDPARTYDIR/octave-4.4.1
#RUN make $LIBDIR/octave/4.4.1/liboctave.so
WORKDIR $THIRDPARTYDIR/octave-4.4.1
#RUN autoreconf -fi
RUN rm -f configure && autoreconf
RUN sed -i -e 's/(name,NAME) name"/(name,NAME) name ## _"/g' configure
RUN emconfigure ./configure \
    F77=$BINDIR/fort77 \
    CC=emcc \
    CXX=em++ \
    AR=emar \
    RANLIB=emranlib \
    CFLAGS="-I$INCDIR -O0" \
    CXXFLAGS="-std=c++11 -I$INCDIR -O0" \
    FFLAGS="-I$INCDIR -O0" \
    FLIBS="" \
    LDFLAGS="-s ERROR_ON_UNDEFINED_SYMBOLS=0 -L$LIBDIR -O0" \
    EMCC_FORCE_STDLIBS=1 \
    EMCONFIGURE_JS=1 \
    BUILD_EXEEXT=.js \
    --prefix=$INSTALLDIR \
    --enable-shared --enable-dl --disable-static \
    --disable-threads --disable-openmp \
    --without-qt --disable-java --enable-fortran-calling-convention=f2c --disable-cross-tools \
    --disable-readline --disable-64 --disable-docs --without-curl --without-fftw3 \
    --without-fftw3f --without-hdf5 --without-opengl --without-qrupdate --without-framework-carbon --without-framework-opengl --without-x \
    --without-arpack --with-blas=-lrefblas --with-lapack=-lclapack \
    --with-pcre-includedir=$INCDIR --with-pcre-libdir=$LIBDIR --without-cholmod --without-cxsparse

#FROM scratch as server
RUN emmake make -j${OCTJOBS:-4}
RUN emmake make install

#FROM scratch as server

#COPY third_party/re2-2020-08-01 $THIRDPARTYDIR/re2-2020-08-01
#RUN cd $THIRDPARTYDIR/re2-2020-08-01 \
#	&& emmake make prefix=$PROJECTDIR/target CXXFLAGS="-g -s LINKABLE=1 -s EXPORT_ALL=1" shared shared-install

COPY src $PROJECTDIR/src
WORKDIR $PROJECTDIR/src
#RUN make all
RUN make web/octave.js
#RUN make worker/octave.js


ARG USER_ID=1000
ARG GROUP_ID=1000

RUN addgroup --gid $GROUP_ID dev
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID dev


COPY test/web/index.html $PROJECTDIR/src/web
COPY test/server.py $PROJECTDIR/src/web
WORKDIR $PROJECTDIR/src/web

EXPOSE 8080
CMD ["python", "/usr/src/octave-wasm/src/web/server.py"]
