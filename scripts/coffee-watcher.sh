#!/usr/bin/env sh

coffee -b -o public/javascripts/ -w app/*.coffee

# -b is evil !
# so we are using it coz we are evil !

# while true; do coffee -b -o public/javascripts/ -w app/*.coffee; done
# <ctrl-z>
# kill -9 %1
