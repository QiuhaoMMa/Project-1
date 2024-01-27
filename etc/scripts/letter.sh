#!/bin/bash

# Start turtlesim
ros2 run turtlesim turtlesim_node &

ros2 service call /kill turtlesim/srv/Kill "{name: turtle1}"

sleep 2


change_color() {
    local turtle_name=$1
    local r=$2
    local g=$3
    local b=$4
    ros2 service call /$turtle_name/set_pen turtlesim/SetPen "{r: $r, g: $g, b: $b ,width: 5}"
}

# Function to publish twist messages
publish_twist() {
    local turtle_name=$1
    local linear_x=$2
    local linear_y=$3
    local angular_z=$4
    ros2 topic pub -1 /$turtle_name/cmd_vel geometry_msgs/Twist "{linear: {x: $linear_x, y: $linear_y, z: 0.0}, angular: {x: 0.0, y: 0.0, z: $angular_z}}"
}

ros2 service call /spawn turtlesim/srv/Spawn "{x: 4, y: 6, theta: 0, name: 'turtleQ'}"
# Draw letter 'Q'
change_color turtleQ 255 100 0  
publish_twist turtleQ 0.0 8.0 6.28
publish_twist turtleQ 0.0 -4.0 0.0


ros2 service call /spawn turtlesim/srv/Spawn "{x: 7.5, y: 8, theta: 0, name: 'turtleI' }"
# Draw letter 'I'
change_color turtleI 0 100 255  
publish_twist turtleI 0.0 -4.0 0.0


# Kill turtlesim
ros2 node kill /turtlesim
ros2 node kill /turtlesim

