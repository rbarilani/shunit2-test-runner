rbarilani/shunit2-test-runner
==============================

A **Unix-like** shell command to run shunit2 tests scripts.

[![Build Status](https://travis-ci.org/rbarilani/shunit2-test-runner.svg)](https://travis-ci.org/rbarilani/shunit2-test-runner)

## Install

### Using git

```
git clone https://github.com/rbarilani/shunit2-test-runner.git
```

This would install an executable script ```./shunit2-test-runner/src/shunit```.


### Using composer

Adds this to your composer.json and run ```composer update rbarilani/shunit2-test-runner```:

```json
{
    "require": {
        "rbarilani/shunit2-test-runner" : "dev-master"
    },
    "repositories" : [
        { "type":"git", "url":"https://github.com/rbarilani/shunit2-test-runner.git" }
    ]
}
```

This would install an executable script ```./vendor/bin/shunit```.

### Using npm

Adds this to your package.json and run ```npm install```:

```json
{
    "dependencies": {
        "rbarilani-shunit2-test-runner" : "git+https://github.com/rbarilani/shunit2-test-runner.git"
    }
}
```

This would install an executable script ```./node_modules/.bin/shunit```.

## Usage

```
Usage:

shunit [--glob=<glob-pattern>] [--config=<config-file>] [-h|--help] [--version]

Options:

* --glob=<glob-pattern>  : a <glob pattern> to match tests scripts to be run (default: 'src/*_test.sh')
* --config=<config-file> : provides options with a <config-file> (default: '.shunitrc')
* -h or --help           : print this help message
* --version              : print command version
```

## Configuration

You can use a config file to provide options to the command.
By default ```shunit``` command search for a ```.shunitrc``` file in the current folder, if found it source that file.
 
Example:

```bash
#!/usr/bin/env bash
# ./.shunitrc

GLOB="my-test-folder/*Test.sh"
```

## Development

### Tests

#### Install shunit2

Install [shunit2] manually 

```
cd vendor && curl -L "http://downloads.sourceforge.net/shunit2/shunit2-2.0.3.tgz" | tar zx ; cd -;
```

or with the help of composer post install hook

```
composer install
```

#### Run tests

```
bash test.sh
```

[shunit2]: https://code.google.com/p/shunit2/


