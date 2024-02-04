cd .\java-spring-service\

docker stop testapp_con

docker rm testapp_con

docker rmi test_img

docker build -t test_img .

docker-compose up

