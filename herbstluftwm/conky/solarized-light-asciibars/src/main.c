/* this is probably where the main function to print and / or save the output will go
 */
#include <stdio.h>

int main ()
{
    // you remember how to comment, right?
    printf("meow world!\n");
}

/*  #===========================#
    #   SECTION DEFINE COLORS   #
    #===========================#

COLOR_ACTIVE="\${color a8c200}"    # #A8C200
COLOR_INACTIVE="\${color EEE8D5}"  # #EEE8D5

COLOR_WARNING="\${color B58900}"   # #B58900
COLOR_CRITICAL="\${color CB4B16}"  # #CB4B16
 */


/*  #==============================#
    #   SECTION CREATE ASCII BAR   #
    #==============================#

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
*/