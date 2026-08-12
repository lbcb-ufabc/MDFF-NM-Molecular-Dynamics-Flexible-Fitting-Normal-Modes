#!/bin/bash
# setup.sh - Installation script for Codespaces

echo "🔧 Updating packages..."
sudo apt-get update

echo "Installing R..."
sudo apt-get install -y r-base

echo "Installing extra dependencies..."
sudo apt-get install -y build-essential libcurl4-openssl-dev libssl-dev libxml2-dev wget tar

echo "Installing Python and required packages..."
sudo apt-get install -y python3 python3-pip
pip3 install numpy matplotlib prody biopython scipy

echo "Installing bio3d in R..."
sudo Rscript -e 'install.packages("bio3d", repos="http://cran.r-project.org")'

echo "Installation complete!"
