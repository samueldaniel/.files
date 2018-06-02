#!/usr/bin/env bash -e
# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
function red () {
  tput setaf 1
}
function green () {
  tput setaf 2
}
function yellow () {
  tput setaf 3
}
function blue () {
  tput setaf 4
}
function magenta () {
  tput setaf 5
}
function cyan () {
  tput setaf 6
}
function white () {
  tput setaf 7
}
function reset () {
  tput sgr0
}
