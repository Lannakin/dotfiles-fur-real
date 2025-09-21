#!/usr/bin/env bash
#
### POLYBAR LAUNCH SCRIPT

### define containing directory for this theme  ###
DIR="${HOME}/.config/herbstluftwm/polybar/"

### define path for this Window Manager's POLYBAR to use for log ###
LOG="${HOME}/LOGS/herbstluftwm-polybar.log"

# send the entirety of herbstlustwm-polybar's execution to the log
exec >"${LOG}" 2>&1

echo "herbstluftwm-polybar: [DEBUG] starting..."
### terminate all existing POLYBAR processes ###
## If all bars have ipc enabled, can use
## polybar-msg cmd quit
# Terminate already running bar instances
killall -q polybar  # note: check ipc
echo "herbstluftwm-polybar: [INFO] SIGKILL ALL sent."

## wait for all POLYBAR processes to terminate ##
while pgrep -u $UID -x polybar >/dev/null;
  do sleep 1;
done

echo "herbstluftwm-polybar: [INFO] initiating..."

### launch the bars... ###
polybar top -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] top bar initiated."
polybar bottom -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] bottom bar initiated."
polybar aux0 -c "$DIR"/config.ini &
sleep 1
echo "herbstluftwm-polybar: [DEBUG] auxillary0 bar initiated."
polybar aux1 -c "$DIR"/config.ini &
echo "herbstluftwm-polybar: [DEBUG] auxillary1 bar initiated."

echo "herbstluftwm-polybar: [INFO] initiation complete."