# Use the official Miniconda image as the base image
FROM continuumio/miniconda3:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the environment YAML file and the requirements.txt file into the container
COPY environment/environment_ml_25.yml .
COPY environment/requirements.txt .

# Create the conda environment from the YAML file and clean up caches.
RUN conda env create -f environment_ml_25.yml && conda clean -afy

# Update PATH to use the new environment. Replace 'ml_25' with the name defined in your YAML.
ENV PATH=/opt/conda/envs/ml_25/bin:$PATH

# Install JupyterLab in case it's not already included in your environment.yml
RUN pip install jupyterlab

# Copy your assignments folder into the container
COPY assignments/ /app/assignments/

# Expose the port for JupyterLab
EXPOSE 8888

# Set the default command to launch JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]