#!/usr/bin/env bash
# src: https://github.com/juacq97/hlwm-save-tree/blob/main/hlwm-save-tree

###############################################################################
#                                                                             #
# LOGFILE MESSAGE SYNTAX:                                                     #
# YYYY-MM-DD HH:MM:SS script-name|loglevel: the message                       #
#                                                                             #
# LOG LEVELS:                                                                 #
# error: a fatal fucking error                                                #
# warning: an error that is not immediately fatal                             #
# info: a normal operational message                                          #
# debug: a message that should only be used for testing and diagnostics       #
#                                                                             #
###############################################################################

#        +----------------------------------------------------------+
#        |                     GLOBALS SECTION                      |
#        +----------------------------------------------------------+

# --| GLOBAL VARIABLES |-------------------------------------------------------
# source container for more global variables
source "${XDG_CONFIG_HOME}"/herbstluftwm/herbstluftwm-env

# Set the directory variable
DIR="${XDG_CONFIG_HOME}"/.config/herbstluftwm/layouts

# --| LOGGING VARIABLES |------------------------------------------------------
# warning: lazy AF
LOGFILE="${HERBSTLUFTWMLOG}"
SCRIPTNAME="herbstluftwm-save-tree"
# timestamp format
TIMESTAMP="$(date +"%Y-%m-%d %H:%M:%S")"
# LOGLEVEL: decrease index with increasing severity
L3="${TIMESTAMP} ${SCRIPTNAME}|debug:"
L2="${TIMESTAMP} ${SCRIPTNAME}|info:"
# L1="${TIMESTAMP} ${SCRIPTNAME}|warning:"
L0="${TIMESTAMP} ${SCRIPTNAME}|error:"

# log all output
# exec >> "${LOGFILE}" >&2

{
  echo "${L3} LOGFILE path is ${LOGFILE}."
  echo "${L3} DIR is ${DIR}"

  SAVE() {
    echo "${L3} opening save menu..."
    name=$(echo "" | dmenu -p "Save layout as:") 
    echo "${name}"
    if [[ ${name} == "" ]]; then
      exit 0
    fi

    # Saving layout
    layout=$(herbstclient dump)
    echo "herbstclient load '${layout}'" >"${DIR}/${name}"

    # # Saving windows configurations
    # for id in $(herbstclient foreach C clients. echo C|grep -oE '0x[0-9a-fA-F]*') ; do
    # client="clients.${id}"
    # rule=(
    #         class="$(herbstclient get_attr ${client}.class)"
    #         instance="$(herbstclient get_attr ${client}.instance)"
    #         tag="$(herbstclient get_attr ${client}.tag)"
    #         title="$(herbstclient get_attr ${client}.title)"
    # )
    # if herbstclient compare "${client}.floating" = on ; then
    #         rule+=( "floating=on" )
    #         consequence=
    # else
    #         rule+=(
    #   "index=$(herbstclient get_attr ${client}.parent_frame.index)"
    #         )
    # fi
    # echo herbstclient rule once "${rule[@]}" "# $id" >> "$DIR/$name"
    # echo herbstclient apply_tmp_r`ule --all "${rule[@]}" "# $id" >> "$DIR/$name"
    # done
  }

  LOAD() {
    sel=$(ls "${DIR}" | dmenu -p "Select layout:" -i -l 10)
    if [[ ${sel} == "" ]]; then
      exit 0
    fi
    cat "${DIR}/${sel}" | sh
  }

  case $1 in
  "save")
    echo "${L3} saving profile..."
    SAVE
    echo "${L2} profile $name saved."
    ;;
  "load")
    echo "${L3} loading profile..."
    LOAD
    echo "${L2} profile ${sel} loaded."
    ;;
  *)
    echo "${L0} invalid input or command."
    ;;
  esac

} >>"${LOGFILE}"
