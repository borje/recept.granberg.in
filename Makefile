all:
	hugo
server:
	hugo server --watch
publish:
	test -e /Volumes/Web/recept
	hugo -d /Volumes/Web/recept
