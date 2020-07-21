run:
	./api

compile: clean
	nim c -d:release api.nim 

clean:
	rm -rf api

docker:
	docker build -t nim-jester-api .

rundocker:
	docker run -p 5000:5000 nim-jester-api