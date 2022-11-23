FROM ubuntu:focal as builder

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
	build-essential autoconf automake libtool cmake file less \
	texinfo flex librsvg2-bin icoutils gperf bison ghostscript gnuplot \
	python3 ca-certificates git openjdk-11-jre curl nano unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/emscripten-core/emsdk.git /usr/src/emsdk
WORKDIR /usr/src/emsdk

#RUN ./emsdk list
#RUN ./emsdk install latest  # --no-cache
#RUN ./emsdk activate latest
#RUN sh ./emsdk_env.sh

RUN git fetch
#RUN git tag -l
ENV SDK_VERSION 3.1.24
RUN git checkout $SDK_VERSION

RUN ./emsdk install ${SDK_VERSION}
RUN ./emsdk activate ${SDK_VERSION}

#RUN sh ./emsdk_env.sh

ENV NODE_VER 14.18.2

ENV PATH="/usr/src/emsdk:/usr/src/emsdk/upstream/emscripten:/usr/src/emsdk/node/${NODE_VER}_64bit/bin:${PATH}"
ENV EMSDK /usr/src/emsdk
ENV EM_CONFIG /usr/src/emsdk/.emscripten
ENV EM_CACHE /usr/src/emsdk/upstream/emscripten/cache
ENV EMSDK_NODE /usr/src/emsdk/node/${NODE_VER}_64bit/bin/node

RUN emcc -v
RUN node -v


ENV PROJECTDIR /usr/src/octave-wasm
ENV THIRDPARTYDIR $PROJECTDIR/third_party
ENV INSTALLDIR $PROJECTDIR/target
ENV BINDIR $INSTALLDIR/bin
ENV INCDIR $INSTALLDIR/include
ENV LIBDIR $INSTALLDIR/lib

WORKDIR $PROJECTDIR
RUN mkdir -p $BINDIR $INCDIR $LIBDIR
#COPY Makefile $PROJECTDIR/Makefile


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
    autoreconf -fi && \
    emmake make F2C=$BINDIR/f2c fort77 && \
    cp fort77 $BINDIR

#FROM scratch as server

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
#RUN cd $THIRDPARTYDIR/pcre-8.43 && \
#    autoreconf -f -i && \
#    emconfigure ./configure CFLAGS="-O0" --prefix=$INSTALLDIR --disable-static --enable-utf && \
#    emmake make install
RUN mkdir -p $THIRDPARTYDIR/pcre-8.43/build && \
    cd $THIRDPARTYDIR/pcre-8.43/build && \
    CC=emcc CXX=em++ AR=emar RANLIB=emranlib cmake .. \
    -DCMAKE_INSTALL_PREFIX=$INSTALLDIR \
    -DBUILD_SHARED_LIBS=ON -DPCRE_BUILD_PCREGREP=OFF -DPCRE_BUILD_TESTS=OFF -DPCRE_SUPPORT_UTF=ON && \
    make -j${JOBS:-4} && \
    make install


COPY third_party/suitesparse-5.4.0 $THIRDPARTYDIR/suitesparse-5.4.0
#RUN make $LIBDIR/libumfpack.so
RUN cd $THIRDPARTYDIR/suitesparse-5.4.0 && \
    emmake make INSTALL=$INSTALLDIR JOBS=${SSJOBS:-1} OPTIMIZATION=-O0 AUTOCC=no \
    F77=$BINDIR/fort77 BLAS=-lrefblas LAPACK=-lclapack RANLIB=emranlib config install


ENV OCTAVE_VER 7.2.0
COPY third_party/octave-${OCTAVE_VER} $THIRDPARTYDIR/octave-${OCTAVE_VER}
WORKDIR $THIRDPARTYDIR/octave-${OCTAVE_VER}
RUN rm -f configure && autoreconf
# Manually set FORTRAN name-mangling to use lower-case and single underscore.
RUN sed -i -e 's/(name,NAME) name"/(name,NAME) name ## _"/g' configure
RUN emconfigure ./configure \
    F77=$BINDIR/fort77 \
    CC=emcc \
    CXX=em++ \
    AR=emar \
    RANLIB=emranlib \
    CFLAGS="-I$INCDIR -O0" \
    CXXFLAGS="-std=c++11 -I$INCDIR -O0 -fwasm-exceptions" \
    FFLAGS="-I$INCDIR -O0 -E" \
    FLIBS="" \
    LDFLAGS="-s ERROR_ON_UNDEFINED_SYMBOLS=0 -L$LIBDIR -O0" \
    EMCC_FORCE_STDLIBS=1 \
    EMCONFIGURE_JS=1 \
    BUILD_EXEEXT=.js \
    --host=wasm32-local-emscripten \
    --prefix=$INSTALLDIR \
    --enable-shared --disable-static \
    --disable-threads --disable-openmp \
    --without-qt --disable-java --enable-fortran-calling-convention=f2c --disable-cross-tools \
    --disable-readline --disable-64 --disable-docs --without-curl --without-fftw3 \
    --without-fftw3f --without-hdf5 --without-opengl --without-qrupdate --without-framework-carbon --without-framework-opengl --without-x \
    --without-arpack --with-blas=-lrefblas --with-lapack=-lclapack \
    --without-sndfile --without-portaudio --without-freetype --without-fontconfig --without-fltk --without-qrupdate \
    --without-sundials_ida --without-sundials_nvecserial --without-sundials_sunlinsolklu --without-qhull_r \
    --with-pcre-includedir=$INCDIR --with-pcre-libdir=$LIBDIR --without-cholmod --without-cxsparse --without-ccolamd \
    --without-z --without-bz2 --without-magick --without-spqr --without-glpk --disable-rapidjson

RUN emmake make -j${OCTJOBS:-4}
RUN emmake make install


COPY src $PROJECTDIR/src
WORKDIR $PROJECTDIR/src
#RUN make all
#RUN make web/octave.js
RUN make worker/octave.js
#RUN make node/octave.js


ARG USER_ID=1000
ARG GROUP_ID=1000

RUN addgroup --gid $GROUP_ID dev
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID dev

#RUN mkdir -p $PROJECTDIR/src/web
#COPY test/web/index.html $PROJECTDIR/src/web
#COPY test/server3.py $PROJECTDIR/src/web
#WORKDIR $PROJECTDIR/src/web

RUN mkdir -p $PROJECTDIR/src/worker
COPY test/worker/index.html $PROJECTDIR/src/worker
COPY test/worker/worker.js $PROJECTDIR/src/worker
COPY test/server3.py $PROJECTDIR/src/worker
WORKDIR $PROJECTDIR/src/worker

EXPOSE 8080
#CMD ["python3", "/usr/src/octave-wasm/src/web/server3.py"]
CMD ["python3", "/usr/src/octave-wasm/src/worker/server3.py"]
