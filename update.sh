#!/bin/bash

set -x
set -e

# Install Dependencies
apt-get update -qq
apt-get install -qy python2.7 libpython2.7-dev python-pip libffi-dev make cpanminus libssl-dev

pip install cryptography
pip install gmusicapi==10.0.1

cpanm --notest Inline
INLINE_PYTHON_EXECUTABLE=/usr/bin/python2.7 cpanm --notest Inline::Python

cpanm --notest IO::Socket::SSL

apt-get remove -qy libpython2.7-dev ibffi-dev make cpanminus libssl-dev
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
