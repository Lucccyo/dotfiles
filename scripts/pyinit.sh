#!/bin/bash

if [[ ! -d "$(pwd)/.venv" ]]; then
  python3.13 -m venv "$(pwd)/.venv"
fi
source "$(pwd)/.venv/bin/activate"
