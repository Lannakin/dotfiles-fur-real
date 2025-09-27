/* i think this is where the code to identify and define file locations will go???
 */
#include <stdio.h>

/*#========================#
  #   SECTION SYSTEM GPU   #
  #========================#
  1. what gpu is being used?
    * is there more than one?  multiple would probably be 1 iGPU and 1 discrete
      but I should likely assume it could be any combination of shit
    * is there an iGPU?

  2. where is usage/load?

  3. where is gpu's temperature?
 */

// 1. what gpu is being used?
/*  * this information is stored in the kernel source
      ? /usr/src/include/drm/drm_pciids.h ? looks like old architexture names
        yeah, no CHIP_NAV31 here. mesa has it?

glxinfo | grep OpenGL
  returns:
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon RX 7900 XT (radeonsi, navi31, LLVM 20.1.8, DRM 3.64, 6.16.8-zen3-1-zen)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 25.2.3-cachyos1.3
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.6 (Compatibility Profile) Mesa 25.2.3-cachyos1.3
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 25.2.3-cachyos1.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
 NOTE: radeonsi = "Gallium3D driver AMD Radeon HD 7000 series / GCN graphics processors and newer"

To get your bus IDs (in hexadecimal):
$ lspci -d ::03xx
03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 [Radeon RX 7900 XT/7900 XTX/7900 GRE/7900M] (rev cc)
19:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Granite Ridge [Radeon Graphics] (rev cb)

      * also can identify which hwmon$1 to use via
    /sys/class/hwmon/hwmon$1/name
        if content is "amdgpu", but my system has 2 devices and only one is
        actually the gpu
 */

/*#========================#
  #   SECTION SYSTEM CPU   #
  #========================#
 1. what cpu is being used?
    * is there more than one CPU?  can I even test this?  like, specifically me,
      the cat.
    * are there multiple cores?  usually these are what linux seems to call cpu$1 etc
        - are there threads?

 2. where is cpu temperature?
    * is there more than one CPU to monitor this on?
    * is there a temperature per-core? UGH!
*/

// 1. what cpu is being used?
/*  the number of cores can be determined by counting the number of directories
    in /dev/cpu/
 */

/*#====================================#
  #   SECTION SYSTEM PHYSICAL MEMORY   #
  #====================================#
  where's the RAM capacity and usage?
    - does the RAM have a temperature sensor?
 */
