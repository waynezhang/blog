#!/bin/sh

cat $1 | sed "s/(\(\/images.*\))/(\/media\1)/g" > tmp
mv tmp $1
