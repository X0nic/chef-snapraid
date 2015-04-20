#!/usr/bin/env bats

load test_helper

@test "snapraid binary is found in PATH" {
  
  # Make sure we can find snapraid
  run sudo su - $SUDO_USER -c "which snapraid"
  [ "$status" -eq 0 ]
}

@test "snapraid sync runs" {
  
  # Run a snapraid sync
  run sudo /usr/local/bin/snapraid --force-empty sync
  [ "$status" -eq 0 ]

  # Check $output contains "Everything OK"
  [[ $output == *"Everything OK"* ]]

}