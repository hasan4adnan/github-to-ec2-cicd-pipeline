#!/bin/bash
cd /home/ec2-user/my-node-app
npm start > app.log 2>&1 &
