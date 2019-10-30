#!/bin/bash

sudo docker build . -t container1-payload-build
sudo docker run -it --entrypoint "/usr/src/wdir/start_payload.sh" container1-payload-build
