#!/bin/sh

# TODO:
# - use m4a-nofpu instead of m4-nofpu
# - Check if the project have imports to the older methods and tell that it use old SDK and should migrate
# Maybe do an auto-upgrade script like 
# RUN sed -i 's/-m4-nofpu/-m4a-nofpu/g' Makefile

# check if curl is present
# if not, download curl
if [ ! -n "$(command -v curl)" ]; then
  sudo apt -y install curl
fi

if [ ! -n "$(command -v unzip)" ]; then
  sudo apt -y install unzip
fi

# wget -O http://example.com/url/to/gcc-sh4.zip

echo "TODO: compile" >> setup.log


#include <stdio.h>
int main() {
   // printf() displays the string inside quotation
   printf("Hello, World!");
   return 0;
}