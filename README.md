# Config files for North Star headsets I've made

Unless I've sent you a North Star headset, this repository is totally unimportant to you.


## `full_size` SLAM configs

I calibrated all the cameras in 1280x800 - better choice so that the Aruco board could be more reliably detected. 

For tracking we always stream at 640x400 - this is for bandwidth reasons, and because Monado's hand tracking mysteriously performs a bit better with lower resolution (it's some problem with the stereographic unprojection code...)

This means that for Basalt to work, `fx`, `fy`, `cx`, and `cy` all have to be multiplied by 1/2. The normal Basalt calibration you'll use (`<your name>/basalt_calibration.json`) is set up like this, whereas all the stuff in `full_size/` have just the original values that Basalt's calibrator spit out.

## `full_size/basalt_calibration_no_imu.json`

These are here just because I have them. They're also used here: https://github.com/moshimeow/calibrate-hmd-v3/blob/master/src/mechanical/upload.cpp so that we can upload a stereo (no IMU - boo Luxonis) calibration to the Pro W Dev's EEPROM. 

I'm not totally sure if it was a good idea to set it up this way, but Monado uses the Pro W's calibration for hand tracking and the calibration that slam_config.toml points to for SLAM. In this case, the calibrations are exactly the same values (modulo resolution/focal length/optical center scale, which Monado's hand tracking deals with gracefully) so it doesn't matter.

## slam_config_no_gui.toml vs slam_config.toml

I've found that Pangolin randomly segfaults in some OpenGL code, so I typically use the `slam_config_no_gui.toml` file, but it's up to you. They are the same in every other way.


## `launch.sh`

You don't have to use this - it's just an example of the environment variables I typically use