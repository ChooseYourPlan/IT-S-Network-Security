#!/bin/bash

sudo docker build . -t container1-payload-build
sudo docker run -it -p 4444:4444 --entrypoint "/usr/src/wdir/start_payload.sh" container1-payload-build
