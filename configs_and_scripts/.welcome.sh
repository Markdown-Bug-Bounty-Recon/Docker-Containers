#!/bin/bash

local -a RAINBOW
local RED GREEN YELLOW BLUE BOLD DIM UNDER RESET

if [ -t 1 ]; then
  RAINBOW=(
    #"$(printf '\033[38;5;196m')"
    #"$(printf '\033[38;5;202m')"
    #"$(printf '\033[38;5;226m')"
    "$(printf '\033[38;5;082m')"
    #"$(printf '\033[38;5;021m')"
    "$(printf '\033[38;5;093m')"
    "$(printf '\033[38;5;163m')"
  )

  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  DIM=$(printf '\033[2m')
  UNDER=$(printf '\033[4m')
  RESET=$(printf '\033[m')
fi

echo '\n'
echo 'blackarch' | figlet -f slant | lolcat

  printf "	%s       %s     %s  __   %s " $RAINBOW $RESET; printf  "${YELLOW} Image Created by: ${BLUE}Cloufish \n $RESET"
  printf "	%s  ____  %s_____%s/ /_  %s " $RAINBOW $RESET; printf "${YELLOW} See ${BOLD} Documentation: *WIP* \n $RESET"
  printf "	%s /_  / %s/ ___/%s __ \ %s\n " $RAINBOW $RESET
  printf "	%s  / /_%s(__  )%s / / / %s\n " $RAINBOW $RESET
  printf "	%s /___/%s____/%s_/ /_/  %s\n " $RAINBOW $RESET
  printf "	%s       %s     %s          %s\n " $RAINBOW $RESET
