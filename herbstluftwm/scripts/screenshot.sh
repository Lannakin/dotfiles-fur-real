#!/usr/bin/env bash
#
# source SCREENSHOTOUTPUT variable
source "/home/lannakin/LA-repos/dotfiles.herbstluftwm/herbstluftwm/herbstluftwm-env"

# scrot leaves lines everywhere if conky updates during selection:
# scrot -s "${FILE}" && xclip -selection c -t image/png < "${FILE}"

# maim:
maim --select --format=png "${SCREENSHOTOUTPUT}" && xclip -selection \
  clipboard -t image/png < "${SCREENSHOTOUTPUT}"
