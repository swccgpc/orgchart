#!/bin/bash

if [ "x$(which convert)" == "x" ]; then
  echo
  echo "Convert not available. Please Install ImageMagick."
  echo
  exit 1
else

  if [ -f /etc/ImageMagick-6/policy.xml ]; then
    sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml
  fi

  if [ -f /etc/ImageMagick-7/policy.xml ]; then
    sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml
  fi

  convert orgchart.pdf -flatten -fuzz 1% -trim +repage orgchart.jpg
fi

exit 0

