#!/usr/bin/env bash
#
# yeah for real i don't know how to neatly separate this.  that's a problem for tomorrow, smile
FILE="${HOME}/Pictures/herbstluftwm_screenshots/screenshot$(date +%s).png"

# we have options. scrot leaves lines everywhere if conky updates during the selection
# scrot -s "${FILE}" && xclip -selection c -t image/png < "${FILE}"
maim --select --format=png "${FILE}" && xclip -selection clipboard -t image/png < "${FILE}"
