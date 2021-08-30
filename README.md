# visidata-docker

## Setup

Start a container:

    ./do.sh dev:build
    ./do.sh dev:run

This opens a shell session with visidata/ as the working directory.

## Usage

Once you have a shell session inside the container, run this command to install VisiData:

    pip install .

Start VisiData:

    ./bin/vd
