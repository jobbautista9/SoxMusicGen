#!/bin/bash
play --buffer $2 -S -V1 "${@:3}" repeat "$1" # $1 = how many times to repeat, $2 = buffer
