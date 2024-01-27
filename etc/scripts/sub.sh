function sub() {
    local topic_name
    local file_name
    local rate

    read -p "Type the topic_name: " topic_name
    read -p "Type the file_name.csv: " file_name


    touch "$file_name"

    ros2 topic pub --rate 10 $topic_name geometry_msgs/msg/Pose
    echo "$topic_name" > "$file_name"
    nano $file_name

}

sub