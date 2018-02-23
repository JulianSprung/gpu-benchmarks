#!/usr/bin/env python

import bpy
bpy.context.scene.cycles.device = 'GPU'

# Setting GPU for all scenes? not sure if smart
# alternativly just main scne:
# bpy.data.scenes["Scene"].cycles.device = 'GPU'
for scene_name in bpy.data.scenes.keys():
        bpy.data.scenes[scene_name].cycles.device = 'GPU'

ver = bpy.app.version
new_api = (ver[0] > 2) or (ver[0]==2 and ver[1] >= 78)

if new_api:
        # after blender 2.79:
        bpy.context.user_preferences.addons['cycles'].preferences.compute_device_type = 'CUDA'
        number_of_devices = len(bpy.context.user_preferences.addons['cycles'].preferences.devices)
        for i in range(0,number_of_devices):
                bpy.context.user_preferences.addons['cycles'].preferences.devices[i].use = True
else:
        # before blender 2.79:
        bpy.context.user_preferences.system.compute_device_type = 'CUDA'
        bpy.context.user_preferences.system.compute_device = 'CUDA_MULTI'