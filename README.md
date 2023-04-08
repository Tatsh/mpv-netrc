# mpv-netrc

[![Tests](https://github.com/Tatsh/mpv-netrc/actions/workflows/test.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/Tatsh/mpv-netrc/badge.svg?branch=master)](https://coveralls.io/github/Tatsh/mpv-netrc?branch=master)

An mpv plugin to read usernames and passwords from `~/.netrc`. This script only supports netrc
entries that are on a single line.

See _[The .netrc file](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html)_.

## Configuration

If reading from `~/.netrc` (the default), configuration is unnecessary.

To read from an alternative netrc file, do one of the following:

- Create a file named `${CONFIG_DIR}/script-opts/netrc.conf` and set the `netrc-path` key:

  ```plain
  netrc-path=PATH_TO_NETRC
  ```

- Run mpv with `--script-opts=netrc=PATH_TO_NETRC`.

A full path is recommended. Using `~` or `~~` may not work.
