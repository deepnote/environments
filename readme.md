# Quick reference
 * Maintained by: [Deepnote](https://deepnote.com/)
 * Where to get help: [Community](https://community.deepnote.com/join?invitation_token=0ba08a2332e8ec002f56f8c1eefdb5bc49af0bae-ff6f0d9b-5045-4511-b6d3-a4fe2595c951)

## Python image
* [`3.6`, `3.7`, `3.8`, `3.9`](https://github.com/deepnote/environments/blob/main/python/Dockerfile)

### How to build 
```
docker build -t deepnote/python:<TAG>  --build-arg PYTHON_VERSION=<some_version> ./python
```

## R image
* [`3.5.2`, `4.0.4`](https://github.com/deepnote/environments/blob/main/ir/Dockerfile)

### How to build 
```
docker build -t deepnote/ir:<TAG>  --build-arg R_BASE_VERSION=<some_version> ./ir
```
