#!/bin/bash

# 
# This script allows us to install an alternative version of Python in the TensorFlow image
# e.g. replace Python 3.8 for 3.10
# 

# get current python major version
V1=$(python --version | awk -F " " {print'$2'} | awk -F "." {print'$1'})
V2=$(python --version | awk -F " " {print'$2'} | awk -F "." {print'$2'})
CURR_PYTHON_VER=$V1"."$V2

# if new version is specified and different from current major, install new version
if [ ! -z "$1" ] && [ ! $CURR_PYTHON_VER == "$1" ];then
    PYTHON_VER=$1
    # get installed packages for tensorflow
    pip freeze | grep tensorflow >> /tmp/requirements.txt

    # install new python version
    apt-get -y install software-properties-common
    add-apt-repository -y ppa:deadsnakes/ppa
    apt-get -y install python3.10 python3.10-distutils python$PYTHON_VER-venv
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$CURR_PYTHON_VER 1
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$PYTHON_VER 2
    curl -sS https://bootstrap.pypa.io/get-pip.py | python$PYTHON_VER

    # reinstall tensorflow packages
    pip install -r /tmp/requirements.txt; rm -v /tmp/requirements.txt
fi