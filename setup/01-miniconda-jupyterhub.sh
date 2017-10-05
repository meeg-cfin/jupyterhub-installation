#!/bin/bash

cd ~/
mkdir -p tmp
cd tmp

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# sh Miniconda3-latest-Linux-x86_64.sh
sudo sh Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda3
sudo chown -R root:adm /usr/local/miniconda3
sudo chown -R root:adm /usr/local/share
sudo chmod -R g+w /usr/local/miniconda3
sudo chmod -R g+w /usr/local/share

export PATH=/usr/local/miniconda3/bin:${PATH}

conda env create -f jupyterhub.yaml

source activate jupyterhub
python -m bash_kernel.install
python -m octave_kernel.install
ipython kernel install
