#!/usr/bin/env bash
#
### HERBSTLUFTWM APPLICATIONS START SCRIPT

############################
###    GETOPT PHASE 0    ###
## specify shortcut variables in a more conveniently compact location ##
HERBSTLUFTWM="${HOME}/.config/herbstluftwm" # base directory for the Window Manager
HERBSTLUFTWM_POLYBAR="${HERBSTLUFTWM}/polybar/herbstluftwm-polybar.sh"
HERBSTLUFTWM_CONKY="${HERBSTLUFTWM}/conky/herbstluftwm-conky.sh"
KEYBINDMANAGER="${HOME}/LOGS/herbstluftwm-sxhkd.log"

## define path for this script to log to ##
# BTW we're sending it to the Window Manager's log; directory name is in CAPS because I AM DERANGED and named it in CAPS
LOG="${HOME}/LOGS/herbstluftwm-start.log"
exec >"${LOG}" 2>&1

# echo "herbstluftwm-start: [DEBUG] GETOPT P0 completed."

############################
###    GETOPT PHASE 0    ###
## specify what GETOPT arguments are vallid; if they are not valid, terminate execution and           ##
## return "Invalid input." in STDERR (standard error; diagnostic output. it is not limited to errors) ##
# syntax for this scenario: getopt [options] -o|--options optstring [options] [--] parameters
# IDK: does it need to be 'filenameofscript.sh' or can it be 'nameofscript'?
vars=$(getopt -o chps --long conky,help,polybar,sxhkd -n "herbstluftwm-start.sh" -- "$@")

# echo "herbstluftwm-start: [DEBUG] GETOPT P0 completed."

############################
###   GETOPT PHASE 1.0   ###
## reset (?) the positional parameters to the parsed options ##
eval set -- "${vars}"
# eval = tells shell to run another round of shell expansions
# set  = this is a set of parameters
# --   = break out of this iterational loop
# echo "herbstluftwm-start: [DEBUG] GETOPT P1.0 completed."

############################
###   GETOPT PHASE 1.1   ###
## initialize GETOPT variables by setting them to an initialized value ##
export CONKY=false
export POLYBAR=false
export SXHKD=false
export HELP=false
# echo "herbstluftwm-start: [DEBUG] GETOPT P1.1 completed."

############################
###   GETOPT PHASE 2.0   ###
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
    echo "herbstluftwm-start: [INFO] conky initiating..." # output "message" to this log
    "${HERBSTLUFTWM_CONKY}" &
    echo "herbstluftwm-start: [INFO] conky initiated."
    CONKY=true # set GETOPT variable for CONKY to TRUE so that this loop ends
    shift
    ;;
  -p | --polybar)
    ## start polybar config... ##
    # my herbstluftwm polybar already has killall and wait
    "${HERBSTLUFTWM_POLYBAR}" &
    echo "herbstluftwm-start: [INFO] polybar initiating..."
    POLYBAR=true
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
    echo "herbstluftwm-start: [INFO] sxhkd initiating..."
    sleep 1
    ## start SXHKD config...##
    sxhkd -c "${HOME}/.config/herbstluftwm/sxhkdrc" 2>"${KEYBINDMANAGER}"
    dunstify 'sxhkd' 'reloading config ~/.config/herbstluftwm/sxhkdrc'
    echo "[INFO] starting sxhkd using ${HOME}/.config/herbstluftwm/sxhkdrc"
    # cat "${sxhkd_fifo}" >"${KEYBINDMANAGER}" &
    # trap 'rm -f ${hlwm_sxhkd_fifo}' EXIT
    SXHKD=true # set GETOPT variable for SXHKD to TRUE so that this loop ends
    shift
    ;;
  -h | --help)
    HELP=true
    echo "herbstluftwm-start: [INFO] no help / usage written yet. :)"
    shift
    ;;
  --)
    shift
    # echo "herbstluftwm-start: [DEBUG] we did it we reached the -- break of P2!"
    break
    ;;
  *)
    echo "herbstluftwm-start: [ERROR] Invalid argument!"
    exit 1
    ;;
  esac
done

exit

# if [[ ${OPTIND} -eq 1 ]]; then                          # $?    = the value returning exit code of input for herbsluftwm-start -arg --longarg
#   shift $((OPTIND - 1))
#   echo "herbstluftwm-start: [ERROR] invalid option(s)." # -ne 0 = "not equal to" 0
#   exit 1                                                # non-zero exit codes indicate error and terminate script
# fi

# echo "herbstluftwm-start: [DEBUG] GETOPT P2 completed, EOF."
