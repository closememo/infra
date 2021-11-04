# MariaDB local setting

1. docker 설치
2. 해당 위치에서 명령 실행  
   생성 - `docker-compose up`  
   백그라운드에서 생성 - `docker-compose up -d`  
   중지 - `docker-compose stop`
3. database reset  
   삭제 - `docker rm -f mariadb-closememo`  
   재성성 - `docker-compose up -d`
4. database refresh (최신 데이터로 교체)  
   `docker exec -it mariadb-closememo bash refresh`
