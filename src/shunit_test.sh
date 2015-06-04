#!/usr/bin/env bash

SHUNIT_CMD="src/shunit"
FAILED_GLOB="src/fixtures/failed_test.sh"
PASSED_GLOB="src/fixtures/passed_test.sh"
FAILING_BUMPRC="src/fixtures/.shunitrc"


setUp() {
    RESULT=""
}

test_unknown_option_throw_error() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null -c
    assertTrue "must fail" "[ $? = 1 ]"
}

test_no_tests_throw_error() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --glob="notexistent/*_test.sh"
    assertTrue "must fail" "[ $? = 1 ]"
}

test_passed() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --glob="${PASSED_GLOB}"
    assertTrue "must not fail" "[ $? = 0 ]"
}

test_failed() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --glob="${FAILED_GLOB}"
    assertTrue "must fail" "[ $? = 1 ]"
}

test_not_existent_config_file() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --glob="${PASSED_GLOB}" --config="c"
    assertTrue "must fail" "[ $? = 1 ]"
}

test_config_file() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --config="${FAILING_BUMPRC}"
    assertTrue "must fail" "[ $? = 1 ]"
}

test_glob_override_config_file() {
    ${SHUNIT_CMD} 1> /dev/null 2> /dev/null --glob="${PASSED_GLOB}" --config="${FAILING_BUMPRC}"
    assertTrue "must not fail" "[ $? = 0 ]"
}


source $(dirname $0)/../vendor/shunit2-2.0.3/src/shell/shunit2
