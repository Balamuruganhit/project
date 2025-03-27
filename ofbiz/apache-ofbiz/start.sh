#!/bin/bash

# Exit on any error
set -e

echo "Build script Execute"

docker build --target demo --tag ofbiz-docker .

echo "Build script Execute successfully"

echo "execute the run script"

docker run -p 9443:8443 -e TZ=Asia/Kolkata -it ofbiz-docker 

