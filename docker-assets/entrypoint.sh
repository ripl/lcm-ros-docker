#!/bin/bash

set -e

# make the docker container discoverable on the network
echo "`hostname`    127.0.0.1" >> /etc/hosts

# source ROS
source /opt/ros/${ROS_DISTRO}/setup.bash --extend

# source third-party script (if any)
if [ -n "${SOURCE_BASH}" ]; then
    source ${SOURCE_BASH} --extend
fi

# set ROS master URI
export ROS_MASTER_URI="http://${ROS_MASTER_HOST}:11311"

# exec given command
exec "$@"
