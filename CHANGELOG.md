<!-- markdownlint-configure-file {"MD024": { "siblings_only": true } } -->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.3] - 2026-05-02

### Added

- Debug logging on script load and when reading credentials, controlled by mpv's existing log
  level configuration.
- Man page (`man/mpv-netrc.7`) documenting installation, configuration, and the `netrc-path`
  option.

## [0.0.2] - 2023-04-08

### Added

- Installation section in `README.md` explaining where to place `netrc.lua` so mpv will load it.

### Changed

- Renamed the LuaRocks rockspec from `mpv-netrc-0.0.1-1.rockspec` to `mpv-netrc-0.0.2-1.rockspec`
  to publish the new version on LuaRocks.

## [0.0.1] - 2023-04-08

First version.

[unreleased]: https://github.com/Tatsh/mpv-netrc/compare/v0.0.3...HEAD
[0.0.3]: https://github.com/Tatsh/mpv-netrc/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/Tatsh/mpv-netrc/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/Tatsh/mpv-netrc/releases/tag/v0.0.1
