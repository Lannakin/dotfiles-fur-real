#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)

dir="${XDG_CONFIG_HOME}"/rofi/launchers/type-1
theme="style-2"

## Run
rofi \
    -show drun \
    -theme "${dir}"/"${theme}".rasi
