#!/usr/bin/env bash
#
### CONKY LAUNCH SCRIPT

## specify shortcut variables in a more conveniently compact location ##
### define containing directory for this theme  ###
DIR="$HOME/.config/herbstluftwm/conky"
KEYBINDS="$DIR/herbstluftwm-keybinds.conf"
SYSTEMSTATS="$DIR/solarized-systemstats.conf"

### define path for this Window Manager's CONKY to use for log ###
LOG=$HOME/LOGS/herbstluftwm-conky.log     # am not using WM's log to keep clutter down

echo "herbstluftwm-conky: [DEBUG] starting..." &> $LOG
### terminate all existing CONKY processes ###
## If all bars have ipc enabled, can use
## conky-msg cmd quit
# Terminate already running bar instances
killall -q conky
echo "herbstluftwm-conky: [INFO] SIGKILL ALL sent." &>> $LOG

## wait for all CONKY processes to terminate ##
while pgrep -u $UID -x conky >/dev/null;
  do sleep 1;
done

echo "herbstluftwm-conky: [INFO] initiating..." &>> $LOG

# Launch the bar
conky --config="$KEYBINDS" &
echo "herbstluftwm-conky: [DEBUG] keybinds display initiated." &>> $LOG
conky --config="$SYSTEMSTATS" &
echo "herbstluftwm-conky: [DEBUG] systemstats display initiated." &>> $LOG

echo "herbstluftwm-conky: [INFO] initiated." &>> $LOG