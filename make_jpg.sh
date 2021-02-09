#!/bin/bash

if [ "x$(which convert)" == "x" ]; then
  echo
  echo "Convert not available. Please Install ImageMagick."
  echo
  exit 1
else
  convert orgchart.pdf -flatten -fuzz 1% -trim +repage orgchart.jpg
fi

exit 0

