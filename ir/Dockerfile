# TODO: Using debian:sid as the base does not provide very good reproducibility of the build
FROM debian:sid

RUN echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/90local-no-recommends
RUN apt update && apt -y install sudo python-is-python3 python3-pip && rm -rf /var/lib/apt/lists/*

ARG R_BASE_VERSION=4.2.0

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        gcc \
        libopenblas0-pthread \
		littler \
        r-cran-littler \
		r-base=${R_BASE_VERSION}-* \
		r-base-dev=${R_BASE_VERSION}-* \
		r-recommended=${R_BASE_VERSION}-* \
	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
	&& install.r docopt \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install notebook

RUN sudo R -e "install.packages('IRkernel', repos='http://cran.rstudio.com/')"
RUN R -e "IRkernel::installspec()"

# Set default kernel to R
ENV DEFAULT_KERNEL_NAME "ir"
