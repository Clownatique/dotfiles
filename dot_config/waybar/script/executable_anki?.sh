#!/bin/sh

main(){
  ps -A |grep -q .anki-wrapped
  if [[ $? -eq 1 ]] then
    return 0 
  else
    return 1
  fi
}

main
