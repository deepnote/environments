FROM tensorflow/tensorflow:2.4.1-gpu

RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
  git sudo \
  && rm -rf /var/lib/apt/lists/*
