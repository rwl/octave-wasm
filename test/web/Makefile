all: ../server.py index.html octave.js
	python $<

octave.js:
	make -C .. web/octave.js

clean:
	rm -f octave.js octave.wasm octave.data
