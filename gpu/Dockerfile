ARG TENSORFLOW_IMAGE_TAG=2.11.1-gpu
FROM tensorflow/tensorflow:${TENSORFLOW_IMAGE_TAG}

# Install OS dependencies
RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
  build-essential \
  python3-venv \
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
  
# We need to remove some pre-installed pip packages that end up clashing with our compute-deps
RUN pip uninstall -y cryptography

# We create the virtual environment in the home directory in the Dockerfile
# for performance improvement.
RUN python -m venv --system-site-packages ~/venv

# replace python version (optional)
ARG PYTHON_VER
ADD ./gpu/setup.python.sh /tmp/setup.python.sh
RUN bash /tmp/setup.python.sh $PYTHON_VER; rm -v /tmp/setup.python.sh

ENV DEEPNOTE_PYTHON_KERNEL_ONLY=true