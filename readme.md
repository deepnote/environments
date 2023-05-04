# Quick reference
 * Maintained by: [Deepnote](https://deepnote.com/)
 * Where to get help: [Community](https://community.deepnote.com/join?invitation_token=0ba08a2332e8ec002f56f8c1eefdb5bc49af0bae-ff6f0d9b-5045-4511-b6d3-a4fe2595c951)

## Python image
* [`3.7`, `3.8`, `3.9`, `3.10`](https://github.com/deepnote/environments/blob/main/python/Dockerfile)

### How to build 
```
docker build -t deepnote/python:<TAG>  --build-arg FROM_PYTHON_VERSION=<some_version> ./python
```

## Conda images
For every Python version (see above), we also build a `-conda` variant, which includes [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installation.
The Dockerfile for this is at [./python/Dockerfile.conda](./python/Dockerfile.conda).

### How to build
The Conda image is built on top of the `-bullseye` version of our Python image. We don't currently build it in the CI, so you need to build it locally.
```
docker build --build-arg FROM_PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=bullseye -t deepnote/python:${PYTHON_VERSION}-bullseye ./python
```

```
docker build --build-arg FROM_PYTHON_VERSION=<some_version> -t deepnote/python:<some_version>-conda ./python --file ./python/Dockerfile.conda
```

Before pushing and overwritting the tag currently in use in production, please make sure that the image works as expected with our compute dependencies. We've seen case when the image worked locally (you could run `conda`), but it failed in the Deepnote environment with all compute dependencies installed (the `conda` command failed there).

You can do this by tagging the image with `-test` suffix and running it in Deepnote as custom environment.

## R image
* [`3.5.2`, `4.0.4`, `4.2.0`](https://github.com/deepnote/environments/blob/main/ir/Dockerfile)

We also have a variant with number of preinstalled libraries. We build it for all the above mentioned R versions 
and the image is available under `deepnote/ir-with-libs`. See [ir-with-libs](./ir-with-libs/) for more details.

### How to build 
```
docker build -t deepnote/ir:<TAG>  --build-arg R_BASE_VERSION=<some_version> ./ir
```

## GPU image
The image is based on tensorflow docker image and adds packages that are typical part of our other images (`git` most importantly).

We follow the tagging of `tensorflow` image. So `tensorflow/tensorflow:2.4.1-gpu` becomes `deepnote/tensorflow:2.4.1-gpu`.

## Continuous integration
Images are build and pushed to DockerHub using CircleCI pipeline.
Not all images are covered by the continuous integration -- check the [config](./.circleci/config.yml) for more details.

Pull requests are pushed too, but with `-ra-PR_NUMBER` suffix in the tag.