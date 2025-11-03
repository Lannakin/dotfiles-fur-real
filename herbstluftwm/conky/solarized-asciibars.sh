#!/usr/bin/env bash
#
# $HOME/.config/herbstluftwm/conky/solarized-asciibars.sh
#
# ASCII Bar Generator for Conky
# Creates │ character progress bars for system monitoring
#
# Written bly Claude in nearly its entirety

# Color definitions (Conky format)
COLOR_ACTIVE="\${#A8C200}"   # #A8C200
COLOR_INACTIVE="\${#CFCABC}" # #EEE8D5

COLOR_WARNING="\${#B58900}"  # #B58900
COLOR_CRITICAL="\${#CB4B16}" # #CB4B16

# Function to create ASCII bar
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
  for ((i = 0; i < active; i++)); do
    bar="${bar}│"
  done

  # Add inactive segments
  local inactive_bar=""
  for ((i = 0; i < inactive; i++)); do
    inactive_bar="${inactive_bar}│"
  done

  # Output the complete bar
  echo "${COLOR_ACTIVE}${bar}${COLOR_INACTIVE}${inactive_bar}"
}

# Function to get CPU usage for a specific core
get_cpu_usage() {
  local core=$1

  # Take first snapshot
  local stats1
  stats1=$(grep "^cpu${core} " /proc/stat)
  local user1
  user1=$(echo "${stats1}" | awk '{print $2}')
  local nice1
  nice1=$(echo "${stats1}" | awk '{print $3}')
  local system1
  system1=$(echo "${stats1}" | awk '{print $4}')
  local idle1
  idle1=$(echo "${stats1}" | awk '{print $5}')
  local total1=$((user1 + nice1 + system1 + idle1))
  local work1=$((user1 + nice1 + system1))

  # Brief pause
  sleep 0.1

  # Take second snapshot
  local stats2
  stats2=$(grep "^cpu${core} " /proc/stat)
  local user2
  user2=$(echo "${stats2}" | awk '{print $2}')
  local nice2
  nice2=$(echo "${stats2}" | awk '{print $3}')
  local system2
  system2=$(echo "${stats2}" | awk '{print $4}')
  local idle2
  idle2=$(echo "${stats2}" | awk '{print $5}')
  local total2=$((user2 + nice2 + system2 + idle2))
  local work2=$((user2 + nice2 + system2))

  # Calculate usage percentage
  local total_diff=$((total2 - total1))
  local work_diff=$((work2 - work1))

  # set usage to a defined value before using math on it
  local usage=0
  if [[ ${total_diff} -gt 0 ]]; then
    usage=$((work_diff * 100 / total_diff))
  fi

  echo "${usage}"
}

# Function to get memory usage percentage
get_memory_usage() {
  awk '/MemTotal|MemAvailable/ {
        if ($1 == "MemTotal:") total = $2
        if ($1 == "MemAvailable:") available = $2
    }
    END {
        used = total - available
        printf "%.0f", (used / total) * 100
    }' /proc/meminfo
}

# Function to get GPU usage (AMD)
get_gpu_usage() {
  local gpu_file="/sys/class/drm/card1/device/gpu_busy_percent"
  if [[ -f "${gpu_file}" ]]; then
    cat "${gpu_file}" 2>/dev/null || echo "0"
  else
    echo "0"
  fi
}

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
  for ((i = 0; i < active; i++)); do
    bar="${bar}│"
  done

  local inactive_bar=""
  for ((i = 0; i < inactive; i++)); do
    inactive_bar="${inactive_bar}│"
  done

  echo "${bar_color}${bar}${COLOR_INACTIVE}${inactive_bar}"
}

# Main execution based on command line argument
case "$1" in
"cpu")
  # CPU core usage - get specific core number from $2
  core_num=${2:-1}
  usage=$(get_cpu_usage "${core_num}")
  create_bar "${usage}" 100 22
  cpu_usage_format="\${voffset -6}\${font0}\${color2}\${alignr}"
  echo "${cpu_usage_format}${usage}%"
  ;;
"memory")
  # Memory usage
  mem_usage=$(get_memory_usage)
  create_bar "${mem_usage}" 100 32
  ;;
"gpu")
  # GPU usage
  gpu_usage=$(get_gpu_usage)
  create_bar "${gpu_usage}" 100 22
  ;;

"cpu_temp")
  # CPU temperature (adjust path as needed)
  get_temp_bar "/sys/class/hwmon/hwmon2/temp1_input" 100 22
  ;;

"gpu_temp")
  # GPU temperature (adjust path as needed)
  get_temp_bar "/sys/class/hwmon/hwmon5/temp1_input" 100 22
  ;;

"test")
  # Test all functions
  echo "CPU1: $(create_bar "$(get_cpu_usage 1)" 100 22)"
  echo "MEM:  $(create_bar "$(get_memory_usage)" 100 32)"
  echo "GPU:  $(create_bar "$(get_gpu_usage)" 100 22)"
  echo "CPUT: $(get_temp_bar "/sys/class/hwmon/hwmon2/temp1_input" 100 22)"
  echo "GPUT: $(get_temp_bar "/sys/class/hwmon/hwmon5/temp1_input" 100 22)"
  ;;

*)
  echo "Usage: $0 {cpu|memory|gpu|cpu_temp|gpu_temp|test} [core_number]"
  echo "Examples:"
  echo "  $0 cpu 1          # CPU core 1 usage bar"
  echo "  $0 memory         # Memory usage bar"
  echo "  $0 gpu            # GPU usage bar"
  echo "  $0 cpu_temp       # CPU temperature bar"
  echo "  $0 gpu_temp       # GPU temperature bar"
  echo "  $0 test           # Test all bars"
  exit 1
  ;;
esac
