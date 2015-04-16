#!/usr/bin/env bats

@test "snapraid binary is found in PATH" {
  run sudo su - $SUDO_USER -c "which snapraid"
  [ "$status" -eq 0 ]
}
