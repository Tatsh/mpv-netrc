{
  uses_user_defaults: true,
  project_name: 'mpv-netrc',
  version: '0.0.4',
  keywords: ['lua', 'mpv', 'mpv-script', 'netrc'],
  description: 'A Lua plugin for mpv that uses .netrc files to authenticate media URIs.',
  custom_project_badges: [
    {
      anchor: '[![LuaRocks](https://img.shields.io/luarocks/v/tatsh/mpv-netrc)]',
      href: 'https://luarocks.org/modules/tatsh/mpv-netrc',
    },
    {
      anchor: '[![Tests](https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml/badge.svg)]',
      href: 'https://github.com/Tatsh/mpv-netrc/actions/workflows/tests.yml',
    },
    {
      anchor: '[![Coverage Status](https://coveralls.io/repos/github/Tatsh/mpv-netrc/badge.svg?branch=master)]',
      href: 'https://coveralls.io/github/Tatsh/mpv-netrc?branch=master',
    },
  ],
  license: 'MIT',
  project_type: 'lua',
  want_codeql: false,
  want_tests: false,
  luacheck+: [
    'max_code_line_length = 100',
    'max_comment_line_length = 100',
    'max_line_length = 100',
    'max_string_line_length = 100',
  ],
  vscode+: {
    extensions+: {
      recommendations+: ['sumneko.lua'],
    },
    settings+: {
      'Lua.diagnostics.globals'+: ['mp'],
      'Lua.format.defaultConfig'+: {
        align_call_args: 'true',
        continuation_indent: '2',
        end_of_line: 'lf',
        indent_size: '2',
        indent_style: 'space',
        max_line_length: '100',
        quote_style: 'single',
      },
      'Lua.format.enable': true,
      'Lua.workspace.checkThirdParty': false,
      '[lua]'+: {
        'editor.defaultFormatter': 'sumneko.lua',
      },
      'files.associations'+: {
        '*.rockspec': 'lua',
        '.busted': 'lua',
        '.luacheckrc': 'lua',
        '.luacov': 'lua',
      },
    },
  },
  prettierignore+: [
    '*.7',
    '*.lua',
    '*.rockspec',
    '.busted',
    '.lua/',
    '.luacheckrc',
    '.luacov',
    '.luarocks/',
    'lua_modules/',
  ],
  package_json+: {
    scripts+: {
      'gen-manpage': 'pandoc --standalone --to man -o man/mpv-netrc.7',
      qa: 'yarn check-spelling && yarn check-formatting',
      test: 'busted -o utfTerminal',
      'test:cov': 'yarn test && luacov',
    },
  },
  gitignore+: [
    '*.report.out',
    '*.rock',
    '*.stats.out',
    '.lua/',
    '.luarocks/',
    '/.netrc',
    'lua_modules/',
    'luacov-html/',
  ],

}
