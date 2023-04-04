package = 'mpv-netrc'
version = 'scm'
source = {url = 'git+ssh://git@github.com/Tatsh/mpv-netrc.git'}
if version == 'scm' then
  source.branch = 'master'
else
  source.tag = 'v' .. version
end
description = {detailed = [[
    An mpv plugin to read usernames and passwords from ~/.netrc. See _[The .netrc file](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html)_.
    ]], homepage = 'https://github.com/Tatsh/mpv-netrc',
               license = 'MIT <http://opensource.org/licenses/MIT>'}
dependencies = {'lua >= 5.1'}
build = {type = 'builtin', modules = {netrc = 'netrc.lua'}}
test_dependencies = {'busted'}
test = {type = 'busted'}
