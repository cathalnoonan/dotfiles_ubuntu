#!/usr/bin/env bash

function docker_tidy(){
    echo "Checking for containers to remove..."
    if [[ "$(docker container ls -a --format "{{.ID}}")" != "" ]]; then
        echo "Removing containers..."
        docker container rm $(docker container ls -a --format "{{.ID}}");
    else
        echo "No containers to remove."
    fi
    echo;

    echo "Checking for images to remove..."
    if [[ "$(docker image ls -a --format "{{.ID}}")" != "" ]]; then
        echo "Removing images..."
        docker image rm $(docker image ls -a --format "{{.ID}}");
    else
        echo "No images to remove."
    fi
    echo;

    echo "Checking for volumes to remove..."
    if [[ "$(docker volume ls --format "{{.Name}}")" != "" ]]; then
        echo "Removing volumes..."
        docker volume rm $(docker volume ls --format "{{.Name}}");
    else
        echo "No volumes to remove."
    fi
    echo;
}
