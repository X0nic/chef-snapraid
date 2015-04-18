#!/usr/bin/env bats

load test_helper

@test "snapraid binary is found in PATH" {
  run sudo su - $SUDO_USER -c "which snapraid"
  [ "$status" -eq 0 ]
}

@test "snapraid sync runs" {
  run /usr/local/bin/snapraid sync
  [ "$status" -eq 0 ]
}