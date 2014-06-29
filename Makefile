default:
	docker build -t openaustralia/mapit .
run:
	docker run -i -t openaustralia/mapit /bin/bash
