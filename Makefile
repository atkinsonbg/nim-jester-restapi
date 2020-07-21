run:
	./src/api

compile: clean
	nim c -d:release ./src/api.nim 

clean:
	rm -rf ./src/api

docker:
	docker build -t nim-jester-api ./src

rundocker:
	docker run -p 5000:5000 nim-jester-api