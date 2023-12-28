#!/bin/bash
echo 'virtualenv setup in /root directory under .virtualenvs'
/root/.virtualenvs/flexget/venv/bin/flexget  -c /opt/scripts/flexget/config.yml  execute 
