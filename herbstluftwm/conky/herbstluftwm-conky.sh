#!/usr/bin/env bash
# herbstluftwm-conky.sh
#
### CONKY LAUNCH SCRIPT #######################################################
#
# SCRIPT NAME: script-name
# AUTHOR: Literally Some Cat    <https://github.com/Lannakin>
# VERSION DATE: 2025-10-21
# VERSION: 0.0.0            <https://semver.org/>
# LICENSE: MIT License      <https://spdx.org/licenses/MIT.html>
#
# DESCRIPTION:
# Short description of what script-name does.
#
# USAGE:
# bash herbstluftwm-conky.sh
# herbstluftwm-conky.sh
#
# EXAMPLE:
#   herbstluftwm-conky.sh
#
# NOTE:
#   - Make sure to swap proper paths as needed under GLOBAL VARIABLES and
#   LOG SETUP sections
#   - Disable / enable / add desired CONKY configs as needed.
#
# REVISION HISTORY:
# YYYY-MM-DD  VERSION   AUTHOR              DESCRIPTION OF CHANGES
# 2025-09-14  0.0.0     Literally Some Cat  Initial creation.
# 2025-09-15  0.0.1     Literally Some Cat  Linted.
# 2025-09-19  0.1.0     Literally Some Cat  Improved logging handling.
# 2025-09-25  0.2.0     Literally Some Cat  Added Neofetch-rice.
# 2025-10-21  1.0.0     Literally Some Cat  Major updates.
#
# MAJOR UPDATES:
# v1.0.0: Removed Neofetch-rice, refactored logging operations slightly, added
#   this header because fuck having space.
#
###############################################################################
#                                                                             #
# COMMENT SYNTAX:                                                             #
# # --- SECTION NAME --- #                                                    #
# # -- section description                                               -- # #
#     an empty line                                                           #
# # - each command's explanation                                          - # #
# whatever-code()                                                             #
#                                                                             #
###############################################################################
#                                                                             #
# LOGFILE MESSAGE SYNTAX:                                                     #
# script-name|loglevel: the message                                           #
#                                                                             #
# LOG LEVELS:                                                                 #
# error: a fatal fucking error                                                #
# warning: an error that is not immediately fatal                             #
# info: a normal operational message                                          #
# debug: a message that should only be used for testing and diagnostics       #
#                                                                             #
###############################################################################

# --- GLOBAL VARIABLES --- #
# -- define path to each CONKY display to be launched                      -- #

# - CONKY display config files' containing directory                        - #
DIR="${HOME}/.config/herbstluftwm/conky"

# -- CONKY display config files                                            -- #
SYSTEMSTATS="${DIR}/solarized-systemstats.conf"
KEYBINDS_NVIM="${DIR}/solarized-keybinds-lazyvim.conf"
# NEOFETCH="${DIR}/solarized-neofetch-rice.conf"
# KEYBINDS_HLWM="${DIR}/solarized-keybinds-herbstluftwm.conf"

# --- LOG SETUP --- #
# -- define logging parameters for herbstluftwm-conky                      -- #

# - NOTE: comment out "LOG= ..." and "exec ... " lines to disable logging
# - log path                                                                - #
LOG=${HOME}/LOGS/herbstluftwm-conky.log
# - clear log and send all stdout messages to stderr                        - #
exec > "${LOG}" 2>&1

# - [info]: mark start of log file                                          - #
echo "herbstluftwm-conky|info: starting..."

# --- CLOSE EXISING CONKY DISPLAYS --- #
# -- terminate all existing CONKY processes to prevent launching excess    -- #
# -- instances                                                             -- #

# - terminate the processes                                                 - #
# - If all modules have IPC enabled, can use conky-msg cmd quit             - #
killall -q conky

# - [debug]: confirm killall signal                                         - #
echo "herbstluftwm-conky|debug: SIGKILL ALL sent."

# - wait for all existing CONKY processes to terminate                      - #
while pgrep -u "${UID}" -x conky >/dev/null;
  do sleep 1;
done

# - [info]: confirm end of process termination                              - #
echo "herbstluftwm-conky|info: conky processes terminated."

# - [info]: mark start of display intitiation                               - #
echo "herbstluftwm-conky|info: initiating display..."

# --- LAUNCH DISPLAYS --- #
# -- launch each desired CONKY display                                     -- #

# - layout of each command set:                                             - #
# - conky --config="${CONFIG_FILE_PATH}"                                    - #
# - [info] display initiation messages                                      - #
# - [debug] display path sanity check                                       - #

# - display: systemstats                                                    - #
conky --config="${SYSTEMSTATS}" &
echo "herbstluftwm-conky|info: systemstats display initiated."
echo "herbstluftwm-conky|debug: path is ${SYSTEMSTATS}"

# - display: nvim keybinds                                                  - #
conky --config="${KEYBINDS_NVIM}" &
echo "herbstluftwm-conky|info: LazyVim-NeoVim keybinds display initiated."
echo "herbstluftwm-conky|debug: path is ${KEYBINDS_NVIM}"

# - display: neofetch rice                                                  - #
# conky --config="${NEOFETCH}" &
# echo "herbstluftwm-conky|info: neofetch rice display initiated."
# echo "herbstluftwm-conky|debug: path is ${NEOFETCH}"

# - display: herbstluftwm keybinds                                          - #
# conky --config="${KEYBINDS_HLWM}" &
# echo "herbstluftwm-conky|info: herbstluftwm keybinds display initiated."
# echo "herbstluftwm-conky|debug: path is ${KEYBINDS_HLWM}"

# - mark end of display initiation calls                                    - #
echo "herbstluftwm-conky|info: initiation of displays completed."

# - show notification                                                       - #
dunstify --appname="herbstluftwm-conky" --urgency=low \
 --timeout=5 "herbstluftwm-conky" "Restarted displays."

# --- END OF FILE --- #
