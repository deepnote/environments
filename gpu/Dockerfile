ARG TENSORFLOW_IMAGE_TAG=2.9.1-gpu
FROM tensorflow/tensorflow:${TENSORFLOW_IMAGE_TAG}

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

ENV DEEPNOTE_PYTHON_KERNEL_ONLY=true