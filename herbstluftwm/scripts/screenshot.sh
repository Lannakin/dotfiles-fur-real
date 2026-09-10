#!/usr/bin/env bash
# script to use maim/scrot and xclip to take a screenshot of a selection and
# poop it into the directory for herbstluftwm screenshots.
#
# usage: "${XDG_CONFIG_HOME}"/herbstluftwm/scripts/screenshot.sh

# apparently this just won't get env vars from systemd
# shellcheck disable=SC2154
source "${XDG_CONFIG_HOME}"/user-dirs.dirs
SCREENSHOTDATE="$(date +"%Y-%m-%d_%Hh%Mm%Ss")"
SCREENSHOTOUTPUT="$XDG_PICTURES_DIR"/herbstluftwm_screenshots/screenshot_"$SCREENSHOTDATE".png

# maim:
maim --select --format=png "${SCREENSHOTOUTPUT}" && xclip -selection \
  clipboard -t image/png < "${SCREENSHOTOUTPUT}"

# scrot leaves lines everywhere if conky updates during selection, so not using
# scrot i guess
# scrot -s "${FILE}" && xclip -selection c -t image/png < "${FILE}"
