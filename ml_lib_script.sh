#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

ENV_NAME="ml_env"

echo "========================================"
echo " Setting up Machine Learning Environment "
echo "========================================"

# 1. Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 could not be found. Please install Python 3 first."
    exit 1
fi

# 2. Create a virtual environment
echo "-> Creating virtual environment: $ENV_NAME..."
python3 -m venv $ENV_NAME

# 3. Activate the virtual environment
echo "-> Activating virtual environment..."
source $ENV_NAME/bin/activate

# 4. Upgrade pip to the latest version
echo "-> Upgrading pip..."
pip install --upgrade pip setuptools wheel

# 5. Install Data Manipulation & Analysis libraries
echo "-> Installing Data Science core (NumPy, Pandas, SciPy)..."
pip install numpy pandas scipy

# 6. Install Data Visualization libraries
echo "-> Installing Visualization tools (Matplotlib, Seaborn, Plotly)..."
pip install matplotlib seaborn plotly

# 7. Install Core Machine Learning libraries
echo "-> Installing Scikit-Learn & Gradient Boosting (XGBoost, LightGBM)..."
pip install scikit-learn xgboost lightgbm

# 8. Install Deep Learning frameworks (PyTorch & TensorFlow)
# Note: This installs the standard CPU/GPU binaries. 
# For specific CUDA versions of PyTorch, you may need custom pip URLs.
echo "-> Installing Deep Learning frameworks (PyTorch, TensorFlow)..."
pip install torch torchvision torchaudio
pip install tensorflow

# 9. Install NLP & Advanced libraries
echo "-> Installing NLP & Hugging Face Transformers..."
pip install transformers nltk spacy

# 10. Install Utilities & Jupyter
echo "-> Installing JupyterLab and Utilities..."
pip install jupyterlab notebook tqdm joblib

echo "========================================"
echo " Setup Complete! "
echo "========================================"
echo "To start using your new environment, run:"
echo "    source $ENV_NAME/bin/activate"
echo "Then, you can start a notebook by running:"
echo "    jupyter lab"
