all:
	hugo

server:
	hugo server --watch

publish:
	test -e /Volumes/Web/recept
	hugo
	./generateTipuePages.py public/recept
	hugo -d /Volumes/Web/recept

clean:
	rm -rf public
