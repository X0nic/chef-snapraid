#!/usr/bin/env bats

@test "snapraid binary is found in PATH" {
  run which snapraid
  [ "$status" -eq 0 ]
}
