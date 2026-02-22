# mpv-netrc

[![LuaRocks](https://img.shields.io/luarocks/v/Tatsh/mpv-netrc)](https://luarocks.org/modules/tatsh/mpv-netrc)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?logo=lua)](https://www.lua.org/)
[![GitHub tag (with filter)](https://img.shields.io/github/v/tag/Tatsh/mpv-netrc)](https://github.com/Tatsh/mpv-netrc/tags)
[![License](https://img.shields.io/github/license/Tatsh/mpv-netrc)](https://github.com/Tatsh/mpv-netrc/blob/master/LICENSE.txt)
[![GitHub commits since latest release (by SemVer including pre-releases)](https://img.shields.io/github/commits-since/Tatsh/mpv-netrc/v0.0.2/master)](https://github.com/Tatsh/mpv-netrc/compare/v0.0.2...master)
[![QA](https://github.com/Tatsh/mpv-netrc/actions/workflows/qa.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/qa.yml)
[![Tests](https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml/badge.svg)](https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/Tatsh/mpv-netrc/badge.svg?branch=master)](https://coveralls.io/github/Tatsh/mpv-netrc?branch=master)
[![Dependabot](https://img.shields.io/badge/Dependabot-enabled-blue?logo=dependabot)](https://github.com/dependabot)
[![GitHub Pages](https://github.com/Tatsh/mpv-netrc/badge/pages)](https://Tatsh.github.io/mpv-netrc/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Stargazers](https://img.shields.io/github/stars/Tatsh/mpv-netrc?logo=github&style=flat)](https://github.com/Tatsh/mpv-netrc/stargazers)
[![Prettier](https://img.shields.io/badge/Prettier-enabled-black?logo=prettier)](https://prettier.io/)

[![@Tatsh](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fpublic.api.bsky.app%2Fxrpc%2Fapp.bsky.actor.getProfile%2F%3Factor=did%3Aplc%3Auq42idtvuccnmtl57nsucz72&query=%24.followersCount&label=Follow+%40Tatsh&logo=bluesky&style=social)](https://bsky.app/profile/Tatsh.bsky.social)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Tatsh-black?logo=buymeacoffee)](https://buymeacoffee.com/Tatsh)
[![Libera.Chat](https://img.shields.io/badge/Libera.Chat-Tatsh-black?logo=liberadotchat)](irc://irc.libera.chat/Tatsh)
[![Mastodon Follow](https://img.shields.io/mastodon/follow/109370961877277568?domain=hostux.social&style=social)](https://hostux.social/@Tatsh)
[![Patreon](https://img.shields.io/badge/Patreon-Tatsh2-F96854?logo=patreon)](https://www.patreon.com/Tatsh2)

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
