#!/usr/bin/env bash
#
### POLYBAR LAUNCH SCRIPT

### define containing directory for this theme  ###
DIR="$HOME/.config/herbstluftwm/polybar/"

### define path for this Window Manager's POLYBAR to use for log ###
LOG="$HOME/LOGS/herbstluftwm-polybar.log"     # am not using WM's log to keep clutter down

echo "herbstluftwm-polybar: [DEBUG] starting..." &> $LOG
### terminate all existing POLYBAR processes ###
## If all bars have ipc enabled, can use
## polybar-msg cmd quit
# Terminate already running bar instances
killall -q polybar  # note: check ipc
echo "herbstluftwm-polybar: [INFO] SIGKILL ALL sent." &>> $LOG

## wait for all POLYBAR processes to terminate ##
while pgrep -u $UID -x polybar >/dev/null;
  do sleep 1;
done

echo "herbstluftwm-polybar: [INFO] initiating..." &>> $LOG

### launch the bars... ###
polybar top -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] top bar initiated." &>> $LOG
polybar bottom -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] bottom bar initiated." &>> $LOG
polybar aux0 -c "$DIR"/config.ini &
sleep 1
echo "herbstluftwm-polybar: [DEBUG] auxillary0 bar initiated." &>> $LOG
polybar aux1 -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] auxillary1 bar initiated." &>> $LOG

echo "herbstluftwm-polybar: [INFO] initiation complete." &>> $LOG