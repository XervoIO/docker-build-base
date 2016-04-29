#!/bin/bash
set -e
set -x

# Install dependent libraries
apt-get update && apt-get install -y libssl0.9.8 libsqlite-dev \
  libexpat1 libexpat1-dev libicu-dev libpq-dev libcairo2-dev \
  libjpeg8-dev libpango1.0-dev libgif-dev libxml2-dev \
  libmagickcore-dev libmagickwand-dev build-essential libkrb5-dev python-dev \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
  ghostscript

# Install ImageMagick
export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"
cd /opt
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar -xf ImageMagick.tar.gz && mv ImageMagick-* ImageMagick && cd ImageMagick && ./configure && make && sudo make install
ldconfig /usr/local/lib && rm -rf /opt/ImageMagick*
cd /opt
