#!/usr/bin/env bash
# source: https://github.com/juacq97/hlwm-save-tree/blob/main/hlwm-save-tree

# Set the directory variable
DIR="${HOME}/.config/herbstluftwm/layouts"
LOG="${HOME}/LOGS/herbstluftwm.log"

# log all output
exec >> "${LOG}" 2>&1

SAVE () {
    echo "herbstluftwm-save-tree: [DEBUG] opening save menu..."
    name=$(echo "" | dmenu -p "Save layout as:")
    echo "${name}"
    if [[ ${name} == "" ]]; then
      exit 0;
    fi

    # Saving layout
    layout=$(herbstclient dump)
    echo "herbstclient load '${layout}'" > "${DIR}/${name}"

    # # Saving windows configurations
    # for id in $(herbstclient foreach C clients. echo C|grep -oE '0x[0-9a-fA-F]*') ; do
  # client="clients.${id}"
  # rule=(
    #         class="$(herbstclient get_attr ${client}.class)"
    #         instance="$(herbstclient get_attr ${client}.instance)"
    #         tag="$(herbstclient get_attr ${client}.tag)"
    #         title="$(herbstclient get_attr ${client}.title)"
  # )
  # if herbstclient compare "${client}.floating" = on ; then
    #         rule+=( "floating=on" )
    #         consequence=
  # else
    #         rule+=(
  #   "index=$(herbstclient get_attr ${client}.parent_frame.index)"
    #         )
  # fi
  # echo herbstclient rule once "${rule[@]}" "# $id" >> "$DIR/$name"
  # echo herbstclient apply_tmp_r`ule --all "${rule[@]}" "# $id" >> "$DIR/$name"
    # done
}

LOAD () {
    sel=$(ls "${DIR}" | dmenu -p "Select layout:" -i -l 10)
    if [[ ${sel} == "" ]]; then
      exit 0;
    fi
    cat "${DIR}/${sel}" | sh
}

case $1 in
    "save")
      echo "herbstluftwm-save-tree: [INFO] saving profile..."
      SAVE
      echo "herbstluftwm-save-tree: [INFO] profile ${name} saved."
      ;;
    "load")
      echo "herbstluftwm-save-tree: [DEBUG] loading profile..."
      LOAD
      echo "herbstluftwm-save-tree: [DEBUG] profile ${name} loaded."
      ;;
    *)
      echo Error
      echo "herbstluftwm-save-tree: [ERROR] invalid input or command."
      ;;
esac
