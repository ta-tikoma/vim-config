#!/bin/bash
cd devenv
docker-compose exec -T php72 php vendor/bin/phpcbf $@
