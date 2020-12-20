#!/bin/bash
while [ ! -d ".git" ]
do
    cd ../
done
cd devenv
docker-compose exec -T php72 php vendor/bin/phpcs $@
