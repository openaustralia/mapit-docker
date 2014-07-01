default:
	docker build -t openaustralia/mapit .
run:
	docker run -p 8020:80 -i -t openaustralia/mapit /bin/bash
server:
	docker run -p 8020:80 -i -t openaustralia/mapit
