#!/bin/bash

# Check if running as root (sudo)
if [ "$(id -u)" != "0" ]; then
   echo "Use sudo to run script" 1>&2
   exit 1
fi

# check if pip is installed
if [ ! -f "$(which pip)" ]; then
  apt-get --yes install python-pip python-dev build-essential
fi
pip install Flask

# Create the Flask webApp file
cat <<EOF > ~/helloFlask.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World! - From Flask"

if __name__ == "__main__":
    app.run('0.0.0.0')
EOF

# Check if directory exist
if [ ! -d "/var/webapp" ]; then
  mkdir -p /var/webapp/
fi
cp ~/helloFlask.py /var/webapp/

# Run webApp
python /var/webapp/helloFlask.py

