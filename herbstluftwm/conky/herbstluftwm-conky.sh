#!/usr/bin/env bash
#
### CONKY LAUNCH SCRIPT

## specify shortcut variables in a more conveniently compact location ##
### define containing directory for this theme  ###
DIR="${HOME}/.config/herbstluftwm/conky"
KEYBINDS="${DIR}/herbstluftwm-keybinds.conf"
SYSTEMSTATS="${DIR}/solarized-systemstats.conf"
NEOFETCH="${DIR}/solarized-l-neofetch-rice.conf"

### define path for this Window Manager's CONKY to use for log ###
LOG=${HOME}/LOGS/herbstluftwm-conky.log     # am not using WM's log to keep clutter down

exec > "${LOG}" 2>&1

echo "herbstluftwm-conky|debug: starting..."
### terminate all existing CONKY processes ###
## If all bars have ipc enabled, can use
## conky-msg cmd quit
# Terminate already running bar instances
killall -q conky
echo "herbstluftwm-conky|info: SIGKILL ALL sent."

## wait for all CONKY processes to terminate ##
while pgrep -u "${UID}" -x conky >/dev/null;
  do sleep 1;
done

echo "herbstluftwm-conky|info: initiating..."

# Launch the bar
conky --config="${KEYBINDS}" &
echo "herbstluftwm-conky|debug: keybinds display initiated."
conky --config="${SYSTEMSTATS}" &
echo "herbstluftwm-conky|debug: systemstats display initiated."
conky --config="${NEOFETCH}" &
echo "herbstluftwm-conky|debug: neofetch rice display initiated."

echo "herbstluftwm-conky|info: initiating completed."