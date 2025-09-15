#!/usr/bin/env bash
# source: https://github.com/juacq97/hlwm-save-tree/blob/main/hlwm-save-tree

# Set the directory variable
dir="${HOME}/.config/herbstluftwm/layouts"
LOG="${HOME}/LOGS/herbstluftwm.log"

SAVE () {
    echo "herbstluftwm-save-tree: [DEBUG] opening save menu..." &>> "${LOG}"
    name=$(echo "" | dmenu -p "Save layout as:")
    echo "$name"
    if [[ $name == "" ]]; then
      exit 0;
    fi

    # Saving layout
    layout=$(herbstclient dump)
    echo "herbstclient load '$layout'" > "$dir/$name"

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
	# 	"index=$(herbstclient get_attr ${client}.parent_frame.index)"
    #         )
	# fi
	# echo herbstclient rule once "${rule[@]}" "# $id" >> "$dir/$name"
	# echo herbstclient apply_tmp_r`ule --all "${rule[@]}" "# $id" >> "$dir/$name"
    # done
}

LOAD () {
    sel=$(ls "$dir" | dmenu -p "Select layout:" -i -l 10)
    if [[ $sel == "" ]]; then
      exit 0;
    fi
    cat "$dir/$sel" | sh
}

case $1 in
    "save")
      echo "herbstluftwm-save-tree: [INFO] saving profile..." &>> "${LOG}"
      SAVE
      echo "herbstluftwm-save-tree: [INFO] profile ${name} saved." &>> "${LOG}"
      ;;
    "load")
      echo "herbstluftwm-save-tree: [DEBUG] loading profile..." &>> "${LOG}"
      LOAD
      echo "herbstluftwm-save-tree: [DEBUG] profile ${name} loaded." &>> "${LOG}"
      ;;
    *)
      echo Error
      echo "herbstluftwm-save-tree: [ERROR] invalid input or command." &>> "${LOG}"
      ;;
esac
