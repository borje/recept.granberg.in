hugo:
	hugo

tipue: hugo
	./generateTipuePages.py public/recept
	
server: tipue
	gulp
	hugo server --watch

publish: tipue
	gulp
	hugo
	rsync -vaz public pi:www/recept.granberg.in
	#test -e /Volumes/Web/recept
	#hugo -d /Volumes/Web/recept

clean:
	rm -rf public
