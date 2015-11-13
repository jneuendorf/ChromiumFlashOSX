

make: check
	./appify ./chromium-flash ChromiumFlash

force: check
	rm -rf ./ChromiumFlash.app
	make

check:
	./check
