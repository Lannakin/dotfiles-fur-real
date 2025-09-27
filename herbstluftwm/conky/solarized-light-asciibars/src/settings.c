/*  need to fetch settings from a config file so that I don't fucking have to
    recompile if I make changes
 */

/*  NOTE: what settings should be defined?
    --------------------------------------
*/

/*#===================#
  #   SECTION FONTS   #
  #===================#

  * fontDefault      = font if it breaks -- can probably do systemdefault

  * fontASCII        = font for bars
 */

/*#=====================#
  #   SECTION SYMBOLS   #
  #=====================#

  * sumbolASCII = symbols to use for the ASCII bars
  * symbolASCII_default = symbol to use as default
      - add a debug output to catch dropped characters like polybar does
        because that's useful as hell
*/

/*#====================#
  #   SECTION COLORS   #
  #====================#

* barColorActive   = color of occupied section when in some defined range
* barColorActive_default = color of active if not defined
      - should have a default range of from visible% to 100%
      - maybe define which bars use this

* barColorInactive = color of unoccupied section
  * barColorInactive_default = color of inactive if not defined
      - not gonna do this on a per-bar basis, fuck that

* barColorWhatever = color of bar at some other defined range
  - should make sure this is a valid range

* barColorWarning  = color of bar above a threshold
  - should probably validate this value

* barColorCritical = color of bar above a threshold above the warning
  - validate this value
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

  moduleSystemGPU
  ---------------
  * moduleSystemGPU_integrated
    NOTE: make sure it exists
    - moduleSystemGPU_integrated_temp
    - moduleSystemGPU_integrated_usage

  * moduleSystemGPU_discrete$1
    NOTE: make sure it exists
    - moduleSystemGPU_discrete$1_temp
    - moduleSystemGPU_discrete$1_usage

  * moduleSystemGPU_average
    NOTE: add together integrated and / or discrete GPUs
    - moduleSystemGPU_discrete_average_usage
    - moduleSystemGPU_discrete_average_temp
    - moduleSystemGPU_multitype_average_usage
    - moduleSystemGPU_multitype_average_temp

  moduleSystemCPU
  ---------------
  * moduleSystemCPU_uh...socket? unit?
    NOTE: may just be cpu$1 b/c linux might only do per-core
    - moduleSystemCPU_unit$1_usage
    - moduleSystemCPU_unit_usage_average
  * moduleSystemCPU_core$1
    NOTE: may just be cpu$1 b/c linux might only do per-core
    - moduleSystemCPU_core$1_usage
    - moduleSystemCPU_core_usage_average
    - moduleSystemCPU_core$_temp
    - moduleSystemCPU_core_temp_average
  * moduleSystemCPU_thread$1_usage

  moduleSystemMemory
  ------------------
    NOTE: system physical RAM
  * moduleSystemMemory_usage
  * moduleSystemMemory_temp
 */