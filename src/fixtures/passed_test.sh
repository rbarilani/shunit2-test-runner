#!/usr/bin/env bash

test_something() {
    assertEquals "hello" "hello"
}

source $(dirname $0)/../../vendor/shunit2-2.0.3/src/shell/shunit2
