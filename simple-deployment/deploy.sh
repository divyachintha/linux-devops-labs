#!/bin/bash

APP_DIR="/opt/python-app"

echo "Starting deployment..."

if [ ! -d "$APP_DIR" ]; then
    mkdir -p $APP_DIR
fi

cp app.py $APP_DIR/

pkill -f app.py

nohup python3 $APP_DIR/app.py > app.log 2>&1 &

echo "Deployment completed"
