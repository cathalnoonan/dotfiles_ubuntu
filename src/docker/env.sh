#!/usr/bin/env bash

docker_tidy() {
    local docker_system_found=$(docker system info > /dev/null 2>&1 && echo $? || echo $?)
    if [[ "${docker_system_found}" == "0" ]]
    then
        print_then_exec docker system prune --volumes --all
    else
        print_color_red 'docker system' not found.
    fi
}

docker_compose_recreate() {
    local docker_compose_found=$(docker compose version > /dev/null 2>&1 && echo $? || echo $?)
    if [[ "${docker_compose_found}" == "0" ]]
    then
        # TODO: want to have some way to not run the subsequent functions when there is an error running the command
        #   - Don't want to use "set -e". It's considered bad practice. [see: https://stackoverflow.com/questions/19622198/what-does-set-e-mean-in-a-bash-script#answer-19622569]
        print_then_exec docker compose pull
        print_then_exec docker compose build --no-cache
        print_then_exec docker compose down
        print_then_exec docker compose up -d
    else
        print_color_red 'docker compose' not found.
    fi
}
