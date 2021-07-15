#!/bin/bash

if [ "x$(which convert)" == "x" ]; then
  echo
  echo "Convert not available. Installing ImageMagick."
  echo
  sudo apt-get install -y imagemagick
fi

if [ "x$(which gs)" == "x" ]; then
  echo
  echo "gs not available. Installing Ghostscript."
  echo
  sudo apt-get install -y ghostscript
fi

export SUDO_CMD=$(which sudo)
echo
echo "sudo: $SUDO_CMD"
echo

if [ -f /etc/ImageMagick-6/policy.xml ]; then
  echo
  echo "/etc/ImageMagick-6/policy.xml"
  ls -al /etc/ImageMagick-6/policy.xml
  $SUDO_CMD sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml
fi

if [ -f /etc/ImageMagick-7/policy.xml ]; then
  echo
  echo "/etc/ImageMagick-7/policy.xml"
  $SUDO_CMD sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-7/policy.xml
fi

echo
echo "converting orgchart from pdf to jpg"
convert orgchart.pdf -flatten -fuzz 1% -trim +repage orgchart.jpg

echo
echo "done."
echo


exit 0

