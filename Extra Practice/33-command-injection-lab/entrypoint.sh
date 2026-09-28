#!/bin/sh
mkdir -p /training
printf '%s\n' "${CMD_FLAG_VALUE:-FLAG_NOT_CONFIGURED}" > /training/objective.txt
exec python app.py
