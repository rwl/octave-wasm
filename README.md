# octave-wasm

Build system for compiling [GNU Octave](https://www.octave.org) into [Web Assembly](https://webassembly.org).

## Usage

To build the Docker image run:

    $ make build

There are simple examples of how to interact with Octave from JavaScript in the test directory.
The default targets a web environment, but most applications will want to run Octave in a Web Worker.
Running the Docker container will serve the web example at http://localhost:8080

    $ make run

## Development

To update the build process to a newer version of the [Emscripten SDK](https://github.com/emscripten-core/emsdk/tags) modify the `SDK_VERSION` and `NODE_VER` environment variables.
You may need to uncomment the `#RUN sh ./emsdk_env.sh` line to find the version of Node to use.

The build is currently based on GNU Octave 7.2.0.
The vendored source code has various minor modifications that are required for it to compile.
If you wish to update to a newer version of Octave you will likely have to make similar changes.