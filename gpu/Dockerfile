ARG TF_VERSION=2.17.0
FROM tensorflow/tensorflow:${TF_VERSION}-gpu

# Install OS dependencies
RUN set -e && \
  apt-get update \
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
  openssh-client \
  gnupg2 \
  ca-certificates \
  freetds-dev \
  unixodbc-dev \
  libssl-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ENV SHELL=/bin/bash \
  LC_ALL=en_US.UTF-8 \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  DEEPNOTE_PYTHON_KERNEL_ONLY=true

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
locale-gen

# Create virtual environment
RUN python -m venv --system-site-packages ~/venv
