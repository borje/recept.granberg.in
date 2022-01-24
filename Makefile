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
#	rsync -vaz public/* granberg.in:2222:www/recept.granberg.in
	rsync -vaz public/* pi@192.168.1.18:www/recept.granberg.in
	#test -e /Volumes/Web/recept
	#hugo -d /Volumes/Web/recept

clean:
	rm -rf public
