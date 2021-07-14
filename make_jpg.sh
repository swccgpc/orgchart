#!/bin/bash

if [ "x$(which convert)" == "x" ]; then
  echo
  echo "Convert not available. Please Install ImageMagick."
  echo
  exit 1
else

  if [ -f /etc/ImageMagick-6/policy.xml ]; then
    echo
    echo "/etc/ImageMagick-6/policy.xml"
    ls -al /etc/ImageMagick-6/policy.xml
    sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml
  fi

  if [ -f /etc/ImageMagick-7/policy.xml ]; then
    echo
    echo "/etc/ImageMagick-7/policy.xml"
    sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-7/policy.xml
  fi

  echo
  echo "converting orgchart from pdf to jpg"
  convert orgchart.pdf -flatten -fuzz 1% -trim +repage orgchart.jpg

  echo
  echo "done."
  echo
fi

exit 0

