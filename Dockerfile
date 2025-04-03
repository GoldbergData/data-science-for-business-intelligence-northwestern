# Use the official Miniconda image as the base image
FROM continuumio/miniconda3:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the environment YAML file and the requirements.txt file into the container.
# This ensures that any pip dependencies listed in the YAML (via - pip: -r requirements.txt)
# can be found.
COPY environment/environment_ml_25.yml .
COPY environment/requirements.txt .

# Create the conda environment as specified in your YAML file and clean up caches.
RUN conda env create -f environment_ml_25.yml && conda clean -afy

# Update PATH to use the new environment. Replace 'ml_25' with the name defined in your YAML.
ENV PATH /opt/conda/envs/ml_25/bin:$PATH

# Install Jupyter Notebook in case it isn't installed via the YAML.
RUN pip install jupyter

# Copy your assignments folder (with your Jupyter notebooks) into the container.
COPY assignments/ /app/assignments/

# Expose the port for Jupyter Notebook.
EXPOSE 8888

# Set the default command to launch Jupyter Notebook.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]