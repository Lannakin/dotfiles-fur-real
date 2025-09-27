/* manipulate the data fetched by INIT routines
 */

/*#======================#
  #   SECTION INTERVAL   #
  #======================#

  * intervalSystemMemory
  * intervalSystemCPU
  * intervalSystemGPU
 */

/*#=====================#
  #   SECTION MODULES   #
  #=====================#

  define which parameters to monitor
  ==================================

  systemGPU
  ---------------
  * systemGPU
    NOTE: make sure it exists
    - systemGPU_temp
    - systemGPU_usage

  systemCPU
  ---------------

  * systemCPU_cpu$1
    NOTE: may just be cpu$1 b/c linux might only do per-core
    - systemCPU_cpu$1_usage
    - systemCPU_cpu_usage_average
    - systemCPU_cpu$1_temp
    - systemCPU_core_temp_average
  * systemCPU_thread$1_usage
    NOTE: might not be a thing now

  systemMemory
  ------------------
    NOTE: system physical RAM
  * systemMemory_usage
  * systemMemory_temp
 */

/*  #===================================#
    #   SECTION GET PER-COR CPU USAGE   #
    #===================================#
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
 */

/*  #==============================#
    #   SECTION GET MEMORY USAGE   #
    #==============================#

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
 */

/*  #================================#
    #   SECTION GET GPU USAGE (AMD)  #
    #================================#

get_gpu_usage() {
    local gpu_file="/sys/class/drm/card1/device/gpu_busy_percent"
    if [[ -f "${gpu_file}" ]]; then
        cat "${gpu_file}" 2>/dev/null || echo "0"
    else
        echo "0"
    fi
}
 */

/*  #========================================================#
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
