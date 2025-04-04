# Data Science for Business Intelligence - Northwestern

This repository provides the full Python environment and assignment materials for the Northwestern Data Science for Business Intelligence Spring 2025 course.

Students can choose **one of two options** to set up their development environment:

---

## Option 1: Using Conda (Recommended for Simplicity)

If you already have Conda installed (e.g. via Anaconda or Miniconda), you can create the environment using the provided `environment/environment_ml_25.yml`.

### Steps:

```bash
conda env create -f environment/environment_ml_25.yml
conda activate ml_25
pip install -r environment/requirements.txt
```

---

## Option 2: Using pyenv + Python Virtual Environment

If you want more control over your Python setup, use the `setup.sh` script, which:

- Installs Python 3.10.12 via `pyenv` (if not already installed)
- Creates a `venv`-based virtual environment in `ml_25/`
- Installs dependencies from `requirements.txt`

### Prerequisites:

- [pyenv](https://github.com/pyenv/pyenv) installed and working
- Python build dependencies (use `brew install openssl readline sqlite3 xz zlib` on macOS)

### Run the script:

```bash
./setup.sh
source ml_25/bin/activate
```

---

## Folder Structure

```
data-science-for-business-intelligence-northwestern/
├── Dockerfile                # (Optional) Docker setup
├── README.md                 # This file
├── environment/
│   ├── environment_ml_25.yml # Conda environment definition
│   └── requirements.txt      # Pip dependencies
├── setup.sh                  # Script to set up venv using pyenv
└── assignments/
    └── assignment1.ipynb     # Course notebooks
```

---

## 🐳 Optional: Running via Docker

If you'd rather use Docker for full isolation:

```bash
docker build -t ml-course-yuri .
docker run -it -p 8888:8888 ml-course-yuri
```

Once launched, open the printed Jupyter link (with token) in your browser.

---

## Notes

- If using an M1/M2/M3 Mac, `tensorflow` may need to be swapped with `tensorflow-macos` for compatibility.
- All dependencies are listed in `requirements.txt`. You can modify or update them if needed.

---

## Virtual Environment Activation

To activate the environment in the future:

```bash
source ml_25/bin/activate  # if using venv
conda activate ml_25       # if using conda
```