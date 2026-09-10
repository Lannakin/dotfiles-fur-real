#!/usr/bin/env bash
# herbstluftwm-polybar.sh
#
### HERBSTLUFTWM-POLYBAR ######################################################
#
# SCRIPT NAME: herbstluftwm-polybar
# AUTHOR: Literally Some Cat    <https://github.com/Lannakin>
# VERSION DATE: 2025-12-01
# VERSION: 0.1.0            <https://semver.org/>
# LICENSE: MIT License      <https://spdx.org/licenses/MIT.html>
#
# DESCRIPTION:
# Launches each polybar bar according to configs specified.
#
# USAGE:
# herbstluftwm-polybar.sh [OPTIONS] [ARGUMENTS]
#
# OPTIONS:
#   -h, --help          Display this help message and exit.
#   -a, --longopt_a     OPTION_A description.
#   -b, --longopt_b     OPTION_B description.
#   -c, --longopt_c     OPTION_C description.
#
# ARGUMENTS:
#   <arg1>              Description of argument 0.
#   <arg2>              Description of argument 1.
#
# EXAMPLES:
#   script-name -a arg2
#   script-name --longopt_b
#
# NOTE:
#   - Any important considerations or dependencies.
#   - Known issues or limitations.
#
# REVISION HISTORY:
# YYYY-MM-DD  VERSION   AUTHOR              DESCRIPTION OF CHANGES
# yyyy-mm-dd  1.0.0     Literally Some Cat  Initial creation.
# 2025-12-01  0.1.0     Literally Some Cat  Added header section, changed log
#                                           format.
#
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
################################################################################

# --| GLOBAL VARIABLES |-------------------------------------------------------
# source env variables for herbstluftwm-env
source "${HOME}"/.xprofile
source "${HOME}"/.bashrc
source "${XDG_CONFIG_HOME}/herbstluftwm/herbstluftwm-env"

# define containing directory for this theme
DIR="${XDG_CONFIG_HOME}/herbstluftwm/polybar/"

# define path for this Window Manager's POLYBAR to use for log
LOG="${STATUSBARLOG}"
TIMESTAMP="$(date +"%Y-%m-%d %H:%M:%S")"

# send the entirety of herbstlustwm-polybar's execution to the log
exec >"${LOG}" 2>&1

echo "${TIMESTAMP} herbstluftwm-polybar|debug: starting..."
echo "${TIMESTAMP} herbstluftwm-polybar|debug: \$HOME is $HOME"
# --| terminate all existing POLYBAR processes |-------------------------------
# If all bars have ipc enabled, can use
# polybar-msg cmd quit
# Terminate already running bar instances
killall -q polybar  # note: check ipc

#wait for all POLYBAR processes to terminate
while pgrep -u "${UID}" -x polybar >/dev/null;
  do sleep 1;
done

echo "${TIMESTAMP} herbstluftwm-polybar|info: SIGKILL ALL sent."

# --| launch the bars... |-----------------------------------------------------
echo "${TIMESTAMP} herbstluftwm-polybar|info: initiating..."

polybar top -c "$DIR/config.ini" &
echo "${TIMESTAMP} herbstluftwm-polybar|debug: top bar initiated."
polybar bottom -c "$DIR/config.ini" &
echo "${TIMESTAMP} herbstluftwm-polybar|debug: bottom bar initiated."
polybar aux0 -c "$DIR/config.ini" &
sleep 1
echo "${TIMESTAMP} herbstluftwm-polybar|debug: auxillary0 bar initiated."
polybar aux1 -c "$DIR/config.ini" &
echo "${TIMESTAMP} herbstluftwm-polybar|debug: auxillary1 bar initiated."

echo "${TIMESTAMP} herbstluftwm-polybar|info: initiation complete."
