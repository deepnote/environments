# Quick Reference
-  **Maintained by**: [Deepnote](https://deepnote.com/)

## IR Tags
-  [`4.0.3`, `4.2.0`]

## What is Deepnote IR?
Deepnote IR provides official Docker images that are pre-configured for use on [Deepnote](https://deepnote.com). These images include the R programming language installed in specific versions, along with the [IRkernel](https://github.com/IRkernel/IRkernel), which is an R kernel for Jupyter.

These images are designed to facilitate seamless integration with Deepnote's platform, allowing users to leverage R for data analysis and visualization within Jupyter notebooks. If you find that the provided images do not meet all your requirements, you are encouraged to extend them by building your own custom images on top of these bases.

## How to Customize Your Image
To create a custom Docker image based on Deepnote's IR images, you can use the following example Dockerfile:

```dockerfile
FROM deepnote/ir:4.2.0

RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org', dependencies=TRUE)"
```

This example demonstrates how to build upon the `deepnote/ir:4.2.0` image by installing the tidyverse package, a collection of R packages designed for data science. You can modify this Dockerfile to include other R packages or configurations as needed.

# Additional Information
These images serve as a robust foundation for R-based data science projects within Deepnote, providing the necessary tools and libraries to get started quickly. For more detailed information about Deepnote and how these images can enhance your data science workflows, please visit Deepnote's website.

