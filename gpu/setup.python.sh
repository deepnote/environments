#!/bin/bash
set -ex

#
# This script allows us to install a python version of choice
#

PYTHON_VER=$1
TF_VERSION=$2

if [ -z "$1" ];then
  PYTHON_VER="3.8"
fi

if [ -z "$2" ];then
  TF_VERSION="2.9"
fi

PYTHON_VER=$1

# install new python version
apt-get update
apt-get -y install software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get -y install python$PYTHON_VER python$PYTHON_VER-distutils python$PYTHON_VER-venv
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$PYTHON_VER 2
curl -sS https://bootstrap.pypa.io/get-pip.py | python$PYTHON_VER

# symlink python3 to python, as downstream services expect "python" to exist as executable next to python3
ln -s /usr/bin/python3 /usr/bin/python

# We need to remove some pre-installed pip packages that end up clashing with our compute-deps
python"$PYTHON_VER" -m pip uninstall -y cryptography || true
TF_MAJOR_MINOR=$(echo "$TF_VERSION" | cut -d. -f1-2)
# For TF 2.16 and above, we install everything via pip including tensorrt
if [ "$(echo "$TF_MAJOR_MINOR >= 2.16" | bc -l)" -eq 1 ];then
  python"$PYTHON_VER" -m pip install numpy tensorflow[and-cuda]==$TF_VERSION tensorrt -c https://tk.deepnote.com/constraints${PYTHON_VER}.txt
else
  python"$PYTHON_VER" -m pip install numpy tensorflow==$TF_VERSION -c https://tk.deepnote.com/constraints${PYTHON_VER}.txt
fi

# create the virtual environment in the home directory in the Dockerfile
# using our upgraded python version
python"$PYTHON_VER" -m venv --system-site-packages ~/venv
