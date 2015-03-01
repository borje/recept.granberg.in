hugo:
	hugo

tipue: hugo
	./generateTipuePages.py public/recept
	
server: tipue
	hugo server --watch

publish: tipue
	gulp
	test -e /Volumes/Web/recept
	hugo -d /Volumes/Web/recept

clean:
	rm -rf public
