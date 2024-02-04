cd .\java-spring-service\

mvn clean install

docker build -t test_img .

cd ..

docker-compose up

