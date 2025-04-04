# Data Science for Business Intelligence - Northwestern

This repository provides a complete, reproducible Docker-based environment for the Northwestern Data Science for Business Intelligence course. The goal is to allow students to complete assignments in a clean, preconfigured environment without installing libraries on their local system.

## Folder Structure

    data-science-for-business-intelligence-northwestern/
    ├── Dockerfile
    ├── README.txt
    ├── environment/
    │   ├── environment_ml_25.yml
    │   └── requirements.txt
    └── assignments/
        └── assignment1.ipynb

> **Note:**  
> - The `environment_ml_25.yml` file defines the conda environment (including the Python version and dependencies).  
> - The `requirements.txt` file includes additional pip packages.  
> - The `assignments/` folder contains your Jupyter notebooks.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed on your system.
- Docker must be configured to use Linux containers (this is the default on macOS and Windows).

## Building the Docker Image

1. Open a terminal and navigate to the root directory of the project (where the Dockerfile is located).

2. Run the following command to build the Docker image:

    ```bash
    docker build -t ml-course-yuri .
    ```

    This command will:
    - Use the official Miniconda base image.
    - Set up the working directory.
    - Copy the environment files and assignments into the container.
    - Create the conda environment as defined in `environment_ml_25.yml` (with pip dependencies from `requirements.txt`).
    - Install Jupyter Notebook if it is not already installed.
    - Expose port 8888 for Jupyter Notebook.

## Running the Docker Container

Once the image is built, run the container using:

    ```bash
    docker run -it -p 8888:8888 ml-course-yuri
    ```

- The `-it` flag runs the container in interactive mode.
- The `-p 8888:8888` flag maps port 8888 in the container to port 8888 on your host, allowing you to access Jupyter Notebook via your browser.

After running the container, you will see output similar to:

    ```
    [I 18:42:31.123 NotebookApp] Serving notebooks from local directory: /app/assignments
    [I 18:42:31.123 NotebookApp] The Jupyter Notebook is running at:
    [I 18:42:31.123 NotebookApp] http://0.0.0.0:8888/?token=...
    ```

Copy the URL (including the token) from the output and paste it into your web browser to access your notebooks.

## Additional Notes

- **TensorFlow Version:**  
  If you encounter issues with TensorFlow on Linux arm64, ensure that your `requirements.txt` pins a compatible version (e.g., use `tensorflow==2.11.0` instead of `2.11.1`).

- **Modifying the Environment:**  
  If you need to update dependencies, modify the `environment_ml_25.yml` and/or `requirements.txt` files and rebuild the Docker image.

- **Stopping the Container:**  
  To stop the container, press `Ctrl+C` in the terminal where it’s running, or run `docker stop <container_id>` from another terminal.