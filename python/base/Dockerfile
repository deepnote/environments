ARG FROM_PYTHON_VERSION=3.7
ARG DEBIAN_VERSION=bullseye
FROM python:${FROM_PYTHON_VERSION}-slim-${DEBIAN_VERSION}
ENV DEBIAN_FRONTEND noninteractive

# Install OS dependencies
RUN apt-get update && apt-get -yq dist-upgrade \
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

# We create the virtual environment in the home directory in the Dockerfile
# for performance improvement.
RUN python -m venv --system-site-packages ~/venv

ENV SHELL=/bin/bash \
  LC_ALL=en_US.UTF-8 \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  DEEPNOTE_PYTHON_KERNEL_ONLY=true

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen
