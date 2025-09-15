ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

# Install OS dependencies
RUN apt-get update && apt-get -y dist-upgrade \
  && apt-get install -yq --no-install-recommends \
  build-essential \
  bzip2 \
  cmake \
  curl \
  git \
  graphviz \
  libgtk2.0-dev \
  locales \
  sudo \
  unzip \
  vim \
  wget \
  ssh \
  gnupg2 \
  && rm -rf /var/lib/apt/lists/*

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_REQUIRE_CUDA="cuda>=12.3"

# replace python version (optional) and
# create the virtual environment in the home directory in the Dockerfile
# for performance improvement.
ARG PYTHON_VER
ARG TF_VERSION
ADD ./setup.python.sh /tmp/setup.python.sh
RUN bash /tmp/setup.python.sh ${PYTHON_VER} ${TF_VERSION}; rm -v /tmp/setup.python.sh

ENV DEEPNOTE_PYTHON_KERNEL_ONLY=true
