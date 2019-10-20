#!/bin/bash
   while test $# -gt 0; do
           case "$1" in
                -p)
                    shift
                    pass_arg=$1
                    shift
                    ;;
                *)
                   echo "$1 Nicht bekanntes Flag bitte -p benutzen!"
                   exit 1;
                   ;;
          esac
		  done
g++ -Wall -fopenmp -O3 pass_krack.cpp -o pass_krack
./pass_krack $pass_arg
rm pass_krack
