#!/usr/bin/env bash

for i in `ls ~/.tmux-powerline/segments/np*mac*`
do
  np=`$i`
  if [ "$np" ]
  then
    echo $np
    exit 0
  fi
done
