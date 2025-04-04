#!/bin/bash
set -e

# Desired Python version (change this to the version you require)
DESIRED_PYTHON_VERSION="3.10.12"
# Name of the virtual environment folder
ENV_DIR="ml_25"

# Ensure pyenv is available
if ! command -v pyenv &>/dev/null; then
    echo "Error: pyenv is not installed. Please install pyenv to manage the required Python version."
    exit 1
fi

# Install the desired version if not already installed
if ! pyenv versions --bare | grep -qx "$DESIRED_PYTHON_VERSION"; then
    echo "Installing Python $DESIRED_PYTHON_VERSION via pyenv..."
    pyenv install "$DESIRED_PYTHON_VERSION"
fi

# Set the local pyenv version
pyenv local "$DESIRED_PYTHON_VERSION"

# Get the full path to the desired Python interpreter from pyenv
PYTHON_BIN="$(pyenv which python)"
echo "Using Python interpreter: $PYTHON_BIN"

# Create virtual environment if it does not exist using the desired interpreter
if [ ! -d "$ENV_DIR" ]; then
    echo "Creating virtual environment in '$ENV_DIR' using $PYTHON_BIN..."
    "$PYTHON_BIN" -m venv "$ENV_DIR"
else
    echo "Virtual environment '$ENV_DIR' already exists."
fi

# Activate the virtual environment
source "$ENV_DIR/bin/activate"

# Upgrade pip, setuptools, and wheel to ensure proper package building
echo "Upgrading pip, setuptools, and wheel..."
pip install --upgrade pip setuptools wheel

# Install packages from requirements.txt if it exists
if [ -f "environment/requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    pip install -r environment/requirements.txt
else
    echo "requirements.txt not found in the environment folder."
fi

echo "Setup complete. To activate the virtual environment in the future, run:"
echo "source $ENV_DIR/bin/activate"