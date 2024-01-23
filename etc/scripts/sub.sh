

subscribe_and_log() {
  # Ask for topic_name
  read -p "Type the topic_name: " topic_name

  # Ask for file_name
  read -p "Type the file_name.cvs: " file_name

  # Ask for rate
  read -p "Type the rate at which data is published: " rate

  sub $topic_name $file_name --rate $rate
}
