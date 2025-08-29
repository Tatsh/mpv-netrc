# mpv-netrc

[![LuaRocks](https://img.shields.io/luarocks/v/Tatsh/mpv-netrc)](https://luarocks.org/modules/tatsh/mpv-netrc)
[![GitHub tag (with filter)](https://img.shields.io/github/v/tag/Tatsh/mpv-netrc)](https://github.com/Tatsh/mpv-netrc/tags)
[![License](https://img.shields.io/github/license/Tatsh/mpv-netrc)](https://github.com/Tatsh/mpv-netrc/blob/master/LICENSE.txt)
[![GitHub commits since latest release (by SemVer including pre-releases)](https://img.shields.io/github/commits-since/Tatsh/mpv-netrc/v0.0.2/master)](https://github.com/Tatsh/mpv-netrc/compare/v0.0.2...master)
[![CodeQL](https://github.com/Tatsh/mpv-netrc/actions/workflows/codeql.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/codeql.yml)
[![QA](https://github.com/Tatsh/mpv-netrc/actions/workflows/qa.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/qa.yml)
[![Tests](https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/Tatsh/mpv-netrc/badge.svg?branch=master)](https://coveralls.io/github/Tatsh/mpv-netrc?branch=master)
[![GitHub Pages](https://github.com/Tatsh/mpv-netrc/actions/workflows/pages/pages-build-deployment/badge.svg)](https://tatsh.github.io/mpv-netrc/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Stargazers](https://img.shields.io/github/stars/Tatsh/mpv-netrc?logo=github&style=flat)](https://github.com/Tatsh/mpv-netrc/stargazers)

[![@Tatsh](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fpublic.api.bsky.app%2Fxrpc%2Fapp.bsky.actor.getProfile%2F%3Factor%3Ddid%3Aplc%3Auq42idtvuccnmtl57nsucz72%26query%3D%24.followersCount%26style%3Dsocial%26logo%3Dbluesky%26label%3DFollow%2520%40Tatsh&query=%24.followersCount&style=social&logo=bluesky&label=Follow%20%40Tatsh)](https://bsky.app/profile/Tatsh.bsky.social)
[![Mastodon Follow](https://img.shields.io/mastodon/follow/109370961877277568?domain=hostux.social&style=social)](https://hostux.social/@Tatsh)

An mpv plugin to read usernames and passwords from `~/.netrc`. This script only supports netrc
entries that are on a single line.

See _[The .netrc file](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html)_.

## Installation

Place `netrc.lua` in a place where mpv will read for scripts, such as `~/.config/mpv/scripts` on Linux.

## Configuration

If reading from `~/.netrc` (the default), configuration is unnecessary.

To read from an alternative netrc file, do one of the following:

- Create a file named `${CONFIG_DIR}/script-opts/netrc.conf` and set the `netrc-path` key:

  ```plain
  netrc-path=PATH_TO_NETRC
  ```

- Run mpv with `--script-opts=netrc=PATH_TO_NETRC`.

A full path is recommended. Using `~` or `~~` may not work.
