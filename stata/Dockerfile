FROM ubuntu:latest AS stata
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /tmp/statafiles
WORKDIR /tmp/statafiles
COPY StataNow18Linux64.tar.gz .
RUN tar -zxf StataNow18Linux64.tar.gz
RUN mkdir /usr/local/stata
WORKDIR /usr/local/stata
RUN yes | /tmp/statafiles/install

FROM python:3.8-slim

RUN apt-get update && apt-get install -y curl git postgresql libncurses5 libpng16-16

COPY --from=stata /usr/local/stata /usr/local/stata
COPY *stata.lic /usr/local/stata

# Add stata to path
ENV PATH "$PATH:/usr/local/stata"
RUN mkdir "/usr/local/stata/data"

# Install Go
ENV VERSION 1.18.6
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 bb05f179a773fed60c6a454a24141aaa7e71edfd0f2d465ad610a3b8f1dc7fe8

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN set -eux &&\
  curl -OL $URL &&\
	echo "$SHA256  $FILE" | sha256sum -c - &&\
	tar -C /usr/local -xzf $FILE &&\
	rm $FILE &&\
mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Clean up
RUN rm -rf /tmp/* /var/tmp/*

EXPOSE 5127

RUN pip install stata_kernel && \
    python -m stata_kernel.install
ENV DEFAULT_KERNEL_NAME "stata"
