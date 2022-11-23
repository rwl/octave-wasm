# Copyright 2022 Richard Lincoln. All rights reserved.

IMAGE_TAG = ghcr.io/rwl/octave-wasm:latest
WEBDIR = web
WORKERDIR = worker
NODEDIR = node

all: $(WEBDIR)/octave.js $(WORKERDIR)/octave.js $(NODEDIR)/octave.js

$(WEBDIR)/octave.js:
	docker run -it --rm -d $(IMAGE_TAG)
	CONTAINER_ID=$$(docker ps -alq) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/web/octave.js $(WEBDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/web/octave.wasm $(WEBDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/web/octave.data $(WEBDIR) && \
	docker stop $$CONTAINER_ID

$(WORKERDIR)/octave.js:
	docker run -it --rm -d $(IMAGE_TAG)
	CONTAINER_ID=$$(docker ps -alq) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/worker/octave.js $(WORKERDIR) && \
	docker stop $$CONTAINER_ID

$(NODEDIR)/octave.js:
	docker run -it --rm -d $(IMAGE_TAG)
	CONTAINER_ID=$$(docker ps -alq) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/node/octave.js $(NODEDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/node/octave.wasm $(NODEDIR) && \
	docker cp $$CONTAINER_ID:/usr/src/octave-wasm/src/node/octave.data $(NODEDIR) && \
	docker stop $$CONTAINER_ID

clean:
	rm -f $(WEBDIR)/octave.js $(WEBDIR)/octave.wasm $(WEBDIR)/octave.data
	rm -f $(WORKERDIR)/octave.js $(WORKERDIR)/octave.wasm $(WORKERDIR)/octave.data
	rm -f $(NODEDIR)/octave.js $(NODEDIR)/octave.wasm $(NODEDIR)/octave.data
