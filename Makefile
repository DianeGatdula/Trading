build:
	docker build -t react-app .

run:
	docker run -i -d -p 5000:5000 react-app
