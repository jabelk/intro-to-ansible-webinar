#!/bin/bash

# INSTALL .pyenv TO INSTALL PYTHON - I THINK THIS IS THE BEST WAY TO DO IT!
mkdir .pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# INTIALIZE PYENV
eval "$(pyenv init -)"

# INSTALL PYTHON
pyenv install 3.6.10
pyenv global 3.6.10

# UPDATE PIP AND INSTALL REQUIREMENTS
pip install --upgrade pip
pip install -r requirements.txt 

#CREATE ANSIBLE DIRECTORY AND THEN CLONE REPO
mkdir intro-to-ansible-webinar
git clone https://github.com/jabelk/intro-to-ansible-webinar.git intro-to-ansible-webinar
