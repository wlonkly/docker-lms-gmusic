#!/bin/bash

set -x
set -e

# Install Dependencies
apt-get update
apt-get install -qy python2.7 libpython2.7-dev python-pip libffi-dev \
                    make cpanminus libssl-dev python-lxml

pip install --upgrade setuptools

pip install cryptography
pip install gmusicapi==10.0.1

cpanm --notest Inline
INLINE_PYTHON_EXECUTABLE=/usr/bin/python2.7 cpanm --notest Inline::Python

# "Async::HTTP: Unable to load IO::Socket::SSL, will try connecting to SSL servers in non-SSL mode"
# what are you even doing over there, Async::HTTP? that won't work!
cpanm --notest IO::Socket::SSL

apt-get remove -qy libpython2.7-dev libffi-dev make cpanminus libssl-dev
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
