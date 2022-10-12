FROM ubuntu:bionic as builder

RUN apt-get update && apt-get install -yq --no-install-recommends \
	build-essential autoconf automake libtool cmake file texinfo \
	python ca-certificates git openjdk-11-jre curl nano unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/emscripten-core/emsdk.git /usr/src/emsdk
WORKDIR /usr/src/emsdk
RUN git fetch
RUN git checkout c10e3e86e8ead9243473c7148beaa9261956123b
RUN ./emsdk install sdk-1.38.30-64bit
RUN ./emsdk activate sdk-1.38.30-64bit

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
COPY Makefile $PROJECTDIR/Makefile

COPY third_party/f2c-20160102 $THIRDPARTYDIR/f2c-20160102
RUN make $BINDIR/f2c

COPY third_party/libf2c2-20130926 $THIRDPARTYDIR/libf2c2-20130926
RUN make $LIBDIR/libf2c.so $INCDIR/f2c.h

COPY third_party/fort77-1.15 $THIRDPARTYDIR/fort77-1.15
RUN make $BINDIR/fort77

COPY third_party/lapack-3.4.2 $THIRDPARTYDIR/lapack-3.4.2
#RUN make $LIBDIR/librefblas.so
RUN make $LIBDIR/libclapack.so

COPY third_party/pcre-8.43 $THIRDPARTYDIR/pcre-8.43
RUN make $LIBDIR/libpcre.so

COPY third_party/suitesparse-5.4.0 $THIRDPARTYDIR/suitesparse-5.4.0
RUN make $LIBDIR/libumfpack.so

COPY third_party/octave-4.4.1 $THIRDPARTYDIR/octave-4.4.1
RUN make $LIBDIR/octave/4.4.1/liboctave.so

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
