# About project #

## General info ##

**Text..............................**

## Project Structure ##

![img.png](img.png)

## Docker-compose.yaml example ##

````
version: '3'
services:
manga-translation-service:
build:
context: ./manga-translation-service
ports:
- "8080:8080"
depends_on:
- postgres
environment:
SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/manga_translation
SPRING_DATASOURCE_USERNAME: your_db_username
SPRING_DATASOURCE_PASSWORD: your_db_password

python-service:
build:
context: ./python-service
ports:
- "5000:5000"
depends_on:
- manga-translation-service
- postgres
environment:
MANGA_TRANSLATION_DB_URL: jdbc:postgresql://postgres:5432/manga_translation
MANGA_TRANSLATION_DB_USERNAME: your_db_username
MANGA_TRANSLATION_DB_PASSWORD: your_db_password

postgres:
image: postgres:latest
environment:
POSTGRES_DB: manga_translation
POSTGRES_USER: your_db_username
POSTGRES_PASSWORD: your_db_password
ports:
- "5432:5432"


