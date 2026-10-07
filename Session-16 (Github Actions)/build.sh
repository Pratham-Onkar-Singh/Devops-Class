#!/usr/bin/env bash
set -euo pipefail

python -m compileall -q app.py
pytest -v --junitxml=test-results.xml
docker build -t session-16-ci-cd:local .
