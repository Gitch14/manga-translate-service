``cd .\java-spring-service\``- **enter to java directory**

``docker build -t test_img .`` **- build with name "test_img"**

``docker images `` **- check if image complete successful**

``docker run -d -p 8081:8081 --name=testapp_con test_img`` **- run with command in terminal and go browser to check if work url:``localhost:8081``**

``docker ps`` - check docker-composes if this compose run enter next command to delete all data and cashes ``docker compose rm`` and start enter command at thw start of this guide

``docker-compose up `` - start docker-compose