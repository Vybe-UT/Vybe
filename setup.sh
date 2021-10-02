#!/bin/sh

cd backend
python -m venv venv # make sure it is python 3
source venv/bin/activate # activate venv
pip install -r requirements.txt
