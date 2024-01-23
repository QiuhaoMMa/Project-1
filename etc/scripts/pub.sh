#!/bin/bash

publish_command() {
  local opt="$1"
  local topic_name="$2"
  local msg_type="$3"
  local msg="$4"

  # Your logic for generating the publisher command goes here
  echo "Publishing: pub $opt $topic_name $msg_type $msg"
}
