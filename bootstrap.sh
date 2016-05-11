#!/bin/bash
set -e
set -x

# Need to set them back for bootstrapping the container.
TEMP_DIR=/tmp
TMPDIR=/tmp
TMP_DIR=/tmp

# Install dependent libraries
apt-get update && apt-get install -y libssl0.9.8 libsqlite-dev \
  libexpat1 libexpat1-dev libicu-dev libpq-dev libcairo2-dev \
  libjpeg8-dev libpango1.0-dev libgif-dev libxml2-dev \
  libmagickcore-dev libmagickwand-dev build-essential libkrb5-dev python-dev \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
  ghostscript
