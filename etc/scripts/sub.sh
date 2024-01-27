function sub() {
    local topic_name
    local file_name
    local rate

    read -p "Type the topic_name: " topic_name
    read -p "Type the file_name.csv: " file_name
    read -p "Enter the rate at which data is published: " rate
    
    touch "$file_name"

    ros2 topic echo "$topic_name" --rate "$rate" --append >> "$file_name" &
}

sub