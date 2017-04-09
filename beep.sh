#!/bin/bash

trap "exit 0;" INT;

 if [ $# -lt 3 ]; then
     echo "Usage: $0 tempo freq dur [freq dur freq dur...]" >&2
     exit 1
 fi

 tempo=$1; shift

 while [ -n "$*" ]; do
     freq=$1; shift
     [ $freq -eq 0 ] && freq=1  # beep will fail if $freq is 0
     dur=$1;  shift
     dur=$((60000*$dur/$tempo))
     # ie, 60 (bpm) * 1000 (for milliseconds) * duration / tempo
     # Note: on one of my systems, i had to double it (ie, 12000*). I don't
     # know why, but it makes some of the tunes I've collected sound right.
     # (note: I have not tested all tunes in GRUB)
     #
     # You can generate a single beep command here, but I prefer to step it
     # out since [a] sounds slightly closer to GRUB implementation
     # and [b] easier to debug an off-note
     # BEEPOPTS="$BEEPOPTS $NEXT -f
     # $freq -l $dur"
#     NEXT="-n"
     echo "beep -f $freq -l $dur"
     beep -f $freq -l $dur

     if [[ ! "$?" -eq 0 ]]; then
         exit
     fi
 done

#echo "playing beep $BEEPOPTS"

#beep $BEEPOPTS
