image := "klakegg/hugo:ext-alpine"

docker_run := "docker run --rm -it -u 1000:1000 -v .:/src"

alias server := up

[private]
default:
    @just --list

up:
    {{docker_run}} -p 1313:1313 {{image}} server -D

build: (run "build")

content theFile:
    @just run new content {{theFile}}

run *command:
    {{docker_run}} {{image}} {{command}}

