ARG CUDA_IMAGE_TAG=12.6.3-runtime-ubuntu20.04
FROM nvidia/cuda:${CUDA_IMAGE_TAG}

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

# replace python version (optional) and
# create the virtual environment in the home directory in the Dockerfile
# for performance improvement.
ARG PYTHON_VER
ARG TF_VERSION
ADD ./setup.python.sh /tmp/setup.python.sh
RUN bash /tmp/setup.python.sh ${PYTHON_VER} ${TF_VERSION}; rm -v /tmp/setup.python.sh

# setup cuda for tensorflow
ARG CUDA_IMAGE_TAG
ADD ./setup.cuda.sh /tmp/setup.cuda.sh
RUN bash /tmp/setup.cuda.sh ${CUDA_IMAGE_TAG}; rm -v /tmp/setup.cuda.sh

ENV DEEPNOTE_PYTHON_KERNEL_ONLY=true
