#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
docker compose up -d --build
echo "Open http://localhost:3000"
