ARG TENSORFLOW_IMAGE_TAG=2.9.1-gpu
FROM tensorflow/tensorflow:${TENSORFLOW_IMAGE_TAG}

RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
  git sudo \
  && rm -rf /var/lib/apt/lists/*
