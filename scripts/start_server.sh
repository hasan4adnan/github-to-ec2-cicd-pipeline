#!/bin/bash
echo "Starting Node.js App"
cd /home/ec2-user/app
npm install
npm start &
