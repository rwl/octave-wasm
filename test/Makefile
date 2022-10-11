
IMAGE_TAG = ghcr.io/rwl/octave-wasm:latest
DESTDIR = .

all: octave.js
	python server.py

octave.js:
	docker run -it --rm -d $(IMAGE_TAG)
	CONTAINER_ID=$$(docker ps -alq) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/worker/octave.js $(DESTDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/worker/octave.wasm $(DESTDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/worker/octave.data $(DESTDIR) && \
	docker stop $$CONTAINER_ID

clean:
	rm -f octave.js octave.wasm octave.data
