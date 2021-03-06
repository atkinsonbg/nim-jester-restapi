run: clean compile
	./src/api

compile: clean
	nim c -d:release -d:ssl ./src/api.nim 

clean:
	rm -rf ./src/api

docker:
	docker build -t nim-jester-api .

rundocker:
	docker run -p 5000:5000 nim-jester-api

test:
	nim c -r tests/test_api.nim