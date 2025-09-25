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

ARG TF_VERSION
ENV TF_VERSION=${TF_VERSION}
# fixes issues with the base image not having correct cudnn version
# https://github.com/tensorflow/tensorflow/issues/80538#issuecomment-2645907707
RUN set -ex && \
  if [ "${TF_VERSION}" = "2.19.0" ]; then \
  echo "Installing libcudnn9-cuda-12"; \
  apt update && \
  apt install -y --no-install-recommends \
    libcudnn9-cuda-12 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*; \
  fi

# Prevent breaking changes with numpy
RUN pip install --no-cache-dir numpy -c https://tk.deepnote.com/constraints3.11.txt
