/*  draw bars with refined values from DATA using formats from SETTINGS routines
 */

/*#==============================#
  #   SECTION CREATE ASCII BAR   #
  #==============================#

# Usage: create_bar <current_value> <max_value> <bar_length> [warning_threshold] [critical_threshold]
create_bar() {
local current=$1
local max=$2
local length=$3

# Calculate percentage and active segments
#    local percentage=$((current * 100 / max))
local active=$((current * length / max))
local inactive=$((length - active))

# Build the bar
local bar=""

# Add active segments
for ((i=0; i<active; i++)); do
    bar="${bar}│"
done

# Add inactive segments
local inactive_bar=""
for ((i=0; i<inactive; i++)); do
    inactive_bar="${inactive_bar}│"
done

# Output the complete bar
echo "${COLOR_ACTIVE}${bar}${COLOR_INACTIVE}${inactive_bar}"
}
*/

/*#========================================================#
  #   SECTION GET TEMPERATURE AND CREATE TEMPERATURE BAR   #
  #========================================================#

    // NOTE: maybe separate temperature fetch

# Function to get temperature and create colored bar
get_temp_bar() {
    local temp_source=$1
    local max_temp=${2:-100}
    local bar_length=${3:-22}

    local temp=0
    if [[ -f "${temp_source}" ]]; then
        temp=$(($(cat "${temp_source}" 2>/dev/null || echo "0") / 1000))
    fi

    # Temperature thresholds (in Celsius)
    local warning_temp=70
    local critical_temp=85

    # Create bar with temperature-based coloring
    # local percentage=$((temp * 100 / max_temp))
    local active=$((temp * bar_length / max_temp))
    local inactive=$((bar_length - active))

    local bar_color="${COLOR_ACTIVE}"
    if [[ ${temp} -ge ${critical_temp} ]]; then
        bar_color="${COLOR_CRITICAL}"
    elif [[ ${temp} -ge ${warning_temp} ]]; then
        bar_color="${COLOR_WARNING}"
    fi

    local bar=""
    for ((i=0; i<active; i++)); do
        bar="${bar}│"
    done

    local inactive_bar=""
    for ((i=0; i<inactive; i++)); do
        inactive_bar="${inactive_bar}│"
    done

    echo "${bar_color}${bar}${COLOR_INACTIVE}${inactive_bar}"
}
 */