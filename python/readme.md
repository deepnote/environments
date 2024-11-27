# Quick reference
 * Maintained by: [Deepnote](https://deepnote.com/)

## Python image
* [`3.8`, `3.9`, `3.10`, `3.11`](https://github.com/deepnote/environments/tree/main/python/python)


## How to use this image

### Create a Dockerfile in your Deepnote project


```
FROM deepnote/python:3.9

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt 

```