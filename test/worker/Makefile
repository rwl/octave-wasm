all: ../server.py index.html octave.js
	python $<

octave.js:
	make -C .. worker/octave.js

clean:
	rm -f octave.js
