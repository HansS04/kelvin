#!/bin/bash
ssh kelvin@kelvin.cs.vsb.cz << COMMANDS
  set -ex
  cd kelvin
  git pull
  pip install -r requirements.txt
  python manage.py migrate
  python manage.py collectstatic --no-input -c
  sudo systemctl restart uwsgi kelvin-worker@0
  echo OK
COMMANDS