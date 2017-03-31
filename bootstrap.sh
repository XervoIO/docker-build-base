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
  ghostscript libstdc++-4.9-dev

  # Install ImageMagick
  export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"
  cd /opt
  wget http://www.imagemagick.org/download/ImageMagick.tar.gz
  tar -xf ImageMagick.tar.gz && mv ImageMagick-* ImageMagick && cd ImageMagick && ./configure && make && sudo make install
  # Disable coders that have known vulnerabilities in them
  sed -i '/<policymap>/a <policy domain="coder" rights="none" pattern="EPHEMERAL" />\n  <policy domain="coder" rights="none" pattern="URL" />\n  <policy domain="coder" rights="none" pattern="HTTPS" />\n  <policy domain="coder" rights="none" pattern="MVG" />\n  <policy domain="coder" rights="none" pattern="MSL" />\n  <policy domain="coder" rights="none" pattern="TEXT" />\n  <policy domain="coder" rights="none" pattern="SHOW" />\n  <policy domain="coder" rights="none" pattern="WIN" />\n  <policy domain="coder" rights="none" pattern="PLT" />\n' /usr/local/etc/ImageMagick-7/policy.xml
  ldconfig /usr/local/lib && rm -rf /opt/ImageMagick*
