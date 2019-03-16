```
docker run -d \
-e fleet_admin_username=<user> \
-e fleet_admin_password=<pass> \
-e fleet_database_url="jdbc:mariadb://<ip of server>:3306/fleet" \
-e fleet_database_username=<dbuser> \
-e fleet_database_password=<dbpass> \
-e fleet_dockerhub_username=<dhuser> \
-e fleet_dockerhub_password=<dhpass> \
-p 8080:8080 \
linuxserver/fleet
```
