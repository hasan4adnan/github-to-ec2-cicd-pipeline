#!/bin/bash
echo "Running health check"
curl -f http://localhost:3000 || exit 1
