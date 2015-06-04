#!/usr/bin/env bash

COMMAND="src/shunit"


setUp() {
    RESULT=""
}

test_unknown_option_throw_error() {
    RESULT=$(${COMMAND} 1> /dev/null -c)
    assertTrue "must fail" "[ $? = 1 ]"
}

test_no_tests_throw_error() {
    RESULT=$(${COMMAND} 1> /dev/null 2> /dev/null --glob=notexistent/*_test.sh)
    assertTrue "must fail" "[ $? = 1 ]"
}

test_passed() {
    RESULT=$(${COMMAND} 1> /dev/null 2> /dev/null --glob=src/fixtures/passed_test.sh)
    assertTrue "must not fail" "[ $? = 0 ]"
}

test_failed() {
    RESULT=$(${COMMAND} 1> /dev/null 2> /dev/null --glob=src/fixtures/failed_test.sh)
    assertTrue "must fail" "[ $? = 1 ]"
}

source $(dirname $0)/../vendor/shunit2-2.0.3/src/shell/shunit2
