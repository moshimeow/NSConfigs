#!/bin/bash

# Make sure we're in the directory that this script is in
cd $(dirname $0)

echo $(pwd)/NSConfig.json

NS_CONFIG_PATH=$(pwd)/NSConfig.json SLAM_CONFIG=$(pwd)/slam_config_no_gui.toml XRT_DEBUG_GUI=1 XRT_COMPOSITOR_COMPUTE=1 SLAM_SUBMIT_FROM_START=1 DEPTHAI_FLOODLIGHT_BRIGHTNESS=1500 monado-service
