#!/usr/bin/env bash
# herbstluftwm-after.sh
#
### HERBSTLUFTWM-AFTER ########################################################
#
# SCRIPT NAME: herbstluftwm-after.sh
# AUTHOR: Literally Some Cat    <https://github.com/Lannakin>
# VERSION DATE: 2026-04-10
# VERSION: 0.0.0                <https://semver.org/>
# LICENSE: CC BY-SA 4.0     <https://creativecommons.org/licenses/by-sa/4.0/>
#
# DESCRIPTION:
# Cycles between monitors in herbstluftwm and sets their layouts.
#
# USAGE:
# herbstluftwm-after.sh
#
# NOTE:
#   - This is an attempt to get herbstclient to ACTUALLY cycle the monitors and
#     set the bloody layouts.
#
# REVISION HISTORY:
# YYYY-MM-DD  VERSION   AUTHOR              DESCRIPTION OF CHANGES
# 2026-04-10  0.0.0     Literally Some Cat  Initial creation.
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
###############################################################################

#         +----------------------------------------------------------+
#         |                          SETUP                           |
#         +----------------------------------------------------------+

# --| GLOBAL VARIABLES |-------------------------------------------------------
HLWM_LAYOUTS_DIR="${XDG_CONFIG_HOME}"/herbstluftwm/layouts

# --| LOGGING VARIABLES |------------------------------------------------------
# warning: lazy AF
SCRIPTNAME="herbstluftwm-after"
LOGFILE="${HOME}"/logs/desktop-env/herbstluftwm-after.log
# timestamp format
TIMESTAMP="$(date +"%Y-%m-%d %H:%M:%S")"
# LOGLEVEL: decrease index with increasing severity
# L3="${TIMESTAMP} ${SCRIPTNAME}|debug:"
L2="${TIMESTAMP} ${SCRIPTNAME}|info:"
# L1="${TIMESTAMP} ${SCRIPTNAME}|warning:"
# L0="${TIMESTAMP} ${SCRIPTNAME}|error:"

touch "${LOGFILE}"

exec 1>"${LOGFILE}" 2>&1

echo "${L2} logging output to ${LOGFILE}"

#       +----------------------------------------------------------+
#       |                   SET MONITOR LAYOUTS                    |
#       +----------------------------------------------------------+

# --| MONITOR 0 |--------------------------------------------------------------
# left monitor probably
herbstclient focus_monitor 0
cat "${HLWM_LAYOUTS_DIR}"/1-1 | sh

# --| MONITOR 0 APPS |--
# herbstclient focus_monitor 0
# firefox &

# --| MONITOR 1 |--------------------------------------------------------------
# center monitor probably
# herbstclient cycle_monitor
herbstclient focus_monitor 1
cat "${HLWM_LAYOUTS_DIR}"/1-1 | sh

# --| MONITOR 1 APPS |--

# --| MONITOR 2 |--------------------------------------------------------------
# right monitor probably
# herbstclient cycle_monitor
herbstclient focus_monitor 2
cat "${HLWM_LAYOUTS_DIR}"/1-2-vimpc | sh

# --| MONITOR 2 APPS |--
herbstclient focus_monitor 2
vesktop &
# herbstclient focus_monitor 2
# herbstclient cycle_all +2
# kitty -e vimpc &

# --| AFTER |------------------------------------------------------------------
# refocus to the monitor i will probably be using
herbstclient focus_monitor 1
