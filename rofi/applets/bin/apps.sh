#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Favorite Applications

LOG="${HOME}/LOGS/rofi.log"
exec >"${LOG}" 2>&1

# CMDs (add your apps here)
term_cmd="kitty"
file_cmd="yazi"
text_cmd="geany"
web_cmd="firefox"
music_cmd="kitty -e vimpc"
setting_cmd="xfce4-settings-manager"

#*************************#
#   DIRECTORY VARIABLES   #
#*************************#
#==========================================#

# Set up variables to contain:
#  - the working directory (bin)
#	 - the parent directory (applets)
#	 - rofi's directory (rofi)

# directory that this script is in
WORKINGDIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || {
    echo "[ERROR] cd failed on WORKINGDIR."
    exit 1
  }
  pwd -P
)
# directory that the directory this script is in is in
PARENTDIR=$(
  builtin cd "${WORKINGDIR}"
    cd .. || {
    echo "[ERROR] cd failed on PARENTDIR."
    exit 1
  }
  pwd
)
# the directory that the directory that this script is in is in
# presumably, that's the rofi directory
ROFIDIR=$(
  builtin cd "${PARENTDIR}"
    cd .. || {
    echo "[ERROR] cd failed on ROFIDIR."
    exit 1
  }
  pwd
)

#==========================================#

# Import Current Theme
source "${ROFIDIR}/applets/shared/theme.sh"
theme="${type}/${style}"

# pipe theme stuff separately to prevent masking
theme_combo="/tmp/rofi_theme_combo"
theme_icon="/tmp/rofi_theme_icon"

# if the pipe files don't exist, make them exist
if [[ ! -p ${theme_combo} ]]; then
    mkfifo ${theme_combo}
fi
if [[ ! -p ${theme_icon} ]]; then
    mkfifo ${theme_icon}
fi

# clean up the mkfifos upon exit
trap 'rm -f ${theme_combo} ${theme_icon}' EXIT

cat "${theme}" >theme_combo &
grep "USE_ICON" >theme_icon &

# Theme Elements
prompt='Quick Launch'
# mesg="Installed Packages : $(pacman -Q | wc -l) (pacman)"

if [[ (${theme} == *'type-1'*) || (${theme} == *'type-3'*) || (${theme} == *'type-5'*) ]]; then
  list_col='1'
  list_row='6'
elif [[ (${theme} == *'type-2'*) || (${theme} == *'type-4'*) ]]; then
  list_col='6'
  list_row='1'
fi

# Options

# grab icons from the piped theme stuff
layout=$(cut -d'=' -f2 theme_icon)
if [[ ${layout} == 'NO' ]]; then
  option_1=" Terminal <span weight='light' size='small'><i>(${term_cmd})</i></span>"
  option_2=" Files <span weight='light' size='small'><i>(${file_cmd})</i></span>"
  option_3=" Editor <span weight='light' size='small'><i>(${text_cmd})</i></span>"
  option_4=" Browser <span weight='light' size='small'><i>(${web_cmd})</i></span>"
  option_5=" Music <span weight='light' size='small'><i>(${music_cmd})</i></span>"
  option_6=" Settings <span weight='light' size='small'><i>(${setting_cmd})</i></span>"
else
  option_1=""
  option_2=""
  option_3=""
  option_4=""
  option_5=""
  option_6=""
fi

rm theme_combo
rm theme_icon

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "listview {columns: ${list_col}; lines: ${list_row};}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "${prompt}" \
    -mesg "${mesg}" \
    -markup-rows \
    -theme "${theme}"
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "${option_1}\n${option_2}\n${option_3}\n${option_4}\n${option_5}\n${option_6}" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ $1 == '--opt1' ]]; then
    ${term_cmd}
  elif [[ $1 == '--opt2' ]]; then
    ${file_cmd}
  elif [[ $1 == '--opt3' ]]; then
    ${text_cmd}
  elif [[ $1 == '--opt4' ]]; then
    ${web_cmd}
  elif [[ $1 == '--opt5' ]]; then
    ${music_cmd}
  elif [[ $1 == '--opt6' ]]; then
    ${setting_cmd}
  fi
}

# Actions
chosen="$(run_rofi)"
case "${chosen}" in
"${option_1}")
  run_cmd --opt1
  ;;
"${option_2}")
  run_cmd --opt2
  ;;
"${option_3}")
  run_cmd --opt3
  ;;
"${option_4}")
  run_cmd --opt4
  ;;
"${option_5}")
  run_cmd --opt5
  ;;
"${option_6}")
  run_cmd --opt6
  ;;
*)
  echo "[ERROR] Invalid run_cmd purrameters selected."
  exit 1
  ;;
esac

# close the script when every other command executed through it has been closed
exit