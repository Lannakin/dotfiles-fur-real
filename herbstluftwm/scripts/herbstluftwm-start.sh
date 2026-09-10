#!/usr/bin/env bash

# +----------------------------------------------------------+
# |          HERBSTLUFTWM APPLICATIONS START SCRIPT          |
# +----------------------------------------------------------+

source "${HOME}"/.xprofile
source "${XDG_CONFIG_HOME}"/herbstluftwm/herbstluftwm-env

# --| GLOBAL VARIABLES |-------------------------------------------------------
## specify shortcut variables in a more conveniently compact location ##
HERBSTLUFTWM="${XDG_CONFIG_HOME}"/herbstluftwm # base directory for the Window Manager
HERBSTLUFTWM_POLYBAR="${HERBSTLUFTWM}"/polybar/herbstluftwm-polybar.sh
HERBSTLUFTWM_CONKY="${HERBSTLUFTWM}"/conky/herbstluftwm-conky.sh
# KEYBINDMANAGER="${HOME}"/LOGS/desktop-env/herbstluftwm-sxhkd.log

## define path for this script to log to ##
LOGFILE="${HOME}"/logs/desktop-env/herbstluftwm-start.log

# --| LOGGING VARIABLES |------------------------------------------------------
# warning: lazy AF
SCRIPTNAME="herbstluftwm-start"
# timestamp format
TIMESTAMP="$(date +"%Y-%m-%d %H:%M:%S")"
# LOGLEVEL: decrease index with increasing severity
L3="${TIMESTAMP} ${SCRIPTNAME}|debug:"
L2="${TIMESTAMP} ${SCRIPTNAME}|info:"
# L1="${TIMESTAMP} ${SCRIPTNAME}|warning:"
L0="${TIMESTAMP} ${SCRIPTNAME}|error:"

# log all output
exec >> "${LOGFILE}" >&2

# echo "${L3} LOGFILE path is ${LOGFILE}."
# echo "${L3} HOME is ${HOME}."
# echo "${L3} XDG_CONFIG_HOME is ${XDG_CONFIG_HOME}."
# echo "${L3} HERBSTLUFTWM is ${HERBSTLUFTWM}."

# --| GETOPT PHASE 0 |---------------------------------------------------------
## specify what GETOPT arguments are vallid; if they are not valid, terminate execution and           ##
## return "Invalid input." in STDERR (standard error; diagnostic output. it is not limited to errors) ##
# syntax for this scenario: getopt [options] -o|--options optstring [options] [--] parameters
# IDK: does it need to be 'filenameofscript.sh' or can it be 'nameofscript'?
vars=$(getopt -o chps --long conky,help,polybar,sxhkd -n "herbstluftwm-start.sh" -- "$@")

# echo "${L3} GETOPT P0 completed."

# --| GETOPT PHASE 1.0 |--------------------------------------------------------
## reset (?) the positional parameters to the parsed options ##
eval set -- "${vars}"
# eval = tells shell to run another round of shell expansions
# set  = this is a set of parameters
# --   = break out of this iterational loop
# echo "${L3} GETOPT P1.0 completed."

# --| GETOPT PHASE 1.1 |-------------------------------------------------------
## initialize GETOPT variables by setting them to an initialized value ##
export CONKY_RUNCHECK=false
export POLYBAR_RUNCHECK=false
export SXHKD_RUNCHECK=false
export HELP_RUNCHECK=false
# echo "${L3} GETOPT P1.1 completed."

# --| GETOPT PHASE 2.0 |-------------------------------------------------------
## Process the options
while true; do # while this statement returns 1, execute...
  ## for this case... ##
  case "$1" in
  -c | --conky)
    ## murder all conky processes ##
    killall -q conky
    ## wait for all CONKY processes to terminate ##
    while pgrep -u "${UID}" -x conky >/dev/null; do
      sleep 1
    done
    ## start conky configs...##
    echo "${L2} conky initiating..." # output "message" to this log
    "${HERBSTLUFTWM_CONKY}" &
    echo "${L2} conky initiated."
    CONKY_RUNCHECK=true # set GETOPT variable for CONKY to TRUE so that this loop ends
    shift
    ;;
  -p | --polybar)
    ## start polybar config... ##
    # my herbstluftwm polybar already has killall and wait
    "${HERBSTLUFTWM_POLYBAR}" &
    echo "${L2} polybar initiating..."
    POLYBAR_RUNCHECK=true
    shift
    ;;
  -s | --sxhkd)
    # set up sxhkd status fifo
    # hlwm_sxhkd_fifo="/tmp/hlwm_sxhkd_fifo"
    # if [[ ! -p "${hlwm_sxhkd_fifo}" ]]; then
    #   mkfifo "${hlwm_sxhkd_fifo}"
    # fi
    ## murder SXHKD processes ##
    pkill -x sxhkd
    ## wait for all SXHKD processes to terminate ##
    while pgrep -u "${UID}" -x sxhkd >/dev/null; do
      sleep 1
    done
    echo "${L2} sxhkd initiating..."
    sleep 1 # >/dev/null
    ## start SXHKD config...##
      sxhkd -c "${XDG_CONFIG_HOME}"/herbstluftwm/sxhkdrc &
    dunstify "sxhkd" "reloading config ${XDG_CONFIG_HOME}/herbstluftwm/sxhkdrc" &
    echo "${L2} starting sxhkd using ${XDG_CONFIG_HOME}/herbstluftwm/sxhkdrc"
    # cat "${sxhkd_fifo}" >"${KEYBINDMANAGER}" &
    # trap 'rm -f ${hlwm_sxhkd_fifo}' EXIT
    SXHKD_RUNCHECK=true # set GETOPT variable for SXHKD to TRUE so that this loop ends
    shift
    ;;
  -h | --help)
    HELP_RUNCHECK=true
    echo "${L2} no help / usage written yet. :)"
    shift
    ;;
  --)
    shift
    # echo "${L3} we did it we reached the -- break of P2!"
    break
    ;;
  *)
    echo "${L0} Invalid argument!"
    exit 1
    ;;
  esac
done

exit

# if [[ ${OPTIND} -eq 1 ]]; then                          # $?    = the value returning exit code of input for herbsluftwm-start -arg --longarg
#   shift $((OPTIND - 1))
#   echo "herbstluftwm-start|error: invalid option(s)." # -ne 0 = "not equal to" 0
#   exit 1                                                # non-zero exit codes indicate error and terminate script
# fi

# # echo "${L3} GETOPT P2 completed, EOF."
