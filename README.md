# visidata-docker

Runs [VisiData]() in a container.

## Setup

1. Use Git to clone VisiData into the current directory.

2. Start a development container:

    ./do.sh dev:build

3. Run a development container:

    ./do.sh dev:build
    ./do.sh dev:run

This opens a shell session with *visidata/* on the host system as the working directory.

## Usage

Once you have a shell session inside the container, run this command to install VisiData:

    pip install .

Start VisiData:

    ./bin/vd
