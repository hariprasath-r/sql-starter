# sql-starter

SQL Learning Scripts and Workflow Files

## DB Setup using Docker

1. run the docker-compose file 'mysql-stack.yml'

    - `docker-compose -f mysql-stack.yml -p mysql up`


2. to open an interactive shell into the instance

    - `docker exec -it mysql-engine /bin/bash`


3. to open mysql shell

    - `mysql -uroot -proot`


4. run the sql files under 'db-setup-scripts'
