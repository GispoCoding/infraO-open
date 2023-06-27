#!/usr/bin/env bash

docker run --rm -v "$(pwd)/src:/app" -v "$(pwd)/out:/out" mvaaltola/bookdown:latest ./run.sh
