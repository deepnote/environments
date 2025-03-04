# Quick Reference
-  **Maintained by**: [Deepnote](https://deepnote.com/)

# Supported Tags and Respective Dockerfile Links
-  [`3.8`, `3.9`, `3.10`, `3.11`](https://github.com/deepnote/environments/tree/main/python/python)
-  [`3.8-datascience`, `3.9-datascience`, `3.10-datascience`, `3.11-datascience`](https://github.com/deepnote/environments/blob/main/python/datascience/Dockerfile.datascience)

# What is Deepnote Python?
Deepnote Python is a set of Docker images tailored for use in the Deepnote platform. These images are based on the official [Python Docker images](https://hub.docker.com/_/python) and include additional binaries and configurations to enhance the user experience within Deepnote. They are designed to simplify development workflows, especially for data science projects, by providing pre-configured environments that are ready to use.

# How to Use This Image
## Create Custom Dockerfile for Deepnote Use
To create a custom Dockerfile using Deepnote's Python image, you can start with the following template:

```dockerfile
ARG PYTHON_VERSION=3.9
FROM deepnote/python:$PYTHON_VERSION

#Determine the Python version and set the version-specifications file
ARG PYTHON_VERSION

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt -c https://tk.deepnote.com/constraints${PYTHON_VERSION}.txt
```

This Dockerfile uses the `deepnote/python:3.9` image as a base and installs Python packages specified in requirements.txt. The use of constraints from `https://tk.deepnote.com/constraints<python_version>.txt` ensures compatibility and stability of package installations.

# Additional Information
These images are intended to serve as a starting point for creating reproducible and scalable data science environments in Deepnote. They include various utilities and binaries that streamline workflows, such as Jupyter support, data visualization tools, and more.
For more information about Deepnote and how these images can be used to enhance your data science projects, visit Deepnote's website.
