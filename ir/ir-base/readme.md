# Quick reference
 * Mantained by: [Deepnote](https://deepnote.com/)


## IR tags
[`4.0.3`, `4.2.0`]


## What is Deepnote IR ?

This repository contains official Deepnote IR images that are ready to use in deepnote.com. The image is composed of the R installation in the correct version and the installed R Jupyter kernel https://github.com/IRkernel/IRkernel.

If you are missing something in this image, feel free to build your own on top of this and customize it to your needs.

## Create your own on top of our base

```
FROM deepnote/ir:4.2.0

RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org', dependencies=TRUE)"

```

## Image Variants

