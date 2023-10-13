# Use PyTorch 2.0 image with CUDA 11.7 and cuDNN 8 as the base image
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel

# Set working directory
WORKDIR /app

# Install additional system packages if needed (ffmpeg, rust, etc)
RUN apt-get update && apt-get install -y git ffmpeg

# Copy the local code to the Docker image
COPY . /app/whisperx

# Change to the repository directory
WORKDIR /app/whisperx

# Install the repository using setup.py
RUN pip install .

# If you have additional requirements, you can include the requirements.txt file
# COPY requirements.txt .
# RUN pip install -r requirements.txt

# Change back to the app directory
WORKDIR /app

# Copy other project files (e.g., your application scripts)
COPY . .