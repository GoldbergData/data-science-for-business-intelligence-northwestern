# Data Science for Business Intelligence - Northwestern

This repository provides the full Python environment and directory structure for the Spring 2025 Northwestern course: **Data Science for Business Intelligence**.

You can set up your development environment in one of three ways:

1. Conda (Recommended for simplicity)
2. pyenv + Python virtual environment
3. Docker (Optional, for isolation)

---

## Folder Structure

```
data-science-for-business-intelligence-northwestern/
├── Dockerfile                # Optional Docker setup
├── README.md                 # This file
├── setup.sh                  # Setup script using pyenv + venv
├── environment/
│   ├── environment_ml_25.yml # Conda environment definition
│   └── requirements.txt      # Additional pip packages
└── assignments/              # Place your Jupyter notebooks here
```

---

## Option 1: Using Conda (Recommended)

Install **Anaconda** or **Miniconda**. I prefer Miniconda because it is more light-weight. You can install Miniconda [here](https://www.anaconda.com/docs/getting-started/miniconda/install).

### macOS or Windows:

```bash
conda env create -f environment/environment_ml_25.yml
conda activate ml_25
pip install -r environment/requirements.txt
```

---

## Option 2: Using pyenv + venv (Advanced / Manual)

This approach gives you more control over your Python setup. The provided `setup.sh` will:

- Use `pyenv` or `pyenv-win` to install **Python 3.10.12**
- Create a **venv-based** environment called `ml_25`
- Install all required packages from `requirements.txt`

### macOS Setup:

1. Install `pyenv` and Python build tools:

```bash
brew install pyenv
brew install openssl readline sqlite3 xz zlib
```

2. Install Python 3.10.12 and run the setup script:

```bash
./setup.sh
source ml_25/bin/activate
```

### Windows Setup:

1. Follow the [pyenv-win installation guide](https://github.com/pyenv-win/pyenv-win#installation)

2. Open PowerShell or Command Prompt and run:

```powershell
pyenv install 3.10.12
pyenv global 3.10.12
python -m venv ml_25
ml_25\Scripts\activate
pip install --upgrade pip setuptools wheel
pip install -r environment\requirements.txt
```

---

## Option 3: Using Docker (Optional)

If you want a completely isolated environment (recommended for advanced users or teaching assistants):

```bash
docker build -t ml-course-yuri .
docker run -it -p 8888:8888 ml-course-yuri
```

After launching, Jupyter will print a URL with a token that you can copy into your browser.

---

## Notes

- Save your work inside the `assignments/` folder.
- Python 3.10.12 is the required version for this course environment.
- If you are using a Mac with an M1, M2, or M3 chip, you may need to replace `tensorflow` with `tensorflow-macos` in `requirements.txt`.

---

## Reactivating Your Environment Later

```bash
# If you used conda
conda activate ml_25

# If you used pyenv + venv
source ml_25/bin/activate  # (macOS)
ml_25\Scripts\activate     # (Windows)
```