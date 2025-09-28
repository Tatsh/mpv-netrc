-- luacheck: read globals mp
local msg = require('mp.msg')

---Returns a URL-encoded string. If `s` is not a string or its length is 0, empty string will be
---returned.
---Adapted from https://gist.github.com/liukun/f9ce7d6d14fa45fe9b924a3eed5c3d99
---@param s string
---@return string
local function urlencode(s)
  local first, _ = s:gsub('\n', '\r\n'):gsub('([^%w _%%%-%.~])',
                                             function(c) return ('%%%02X'):format(c:byte()) end)
    :gsub(' ', '+')
  return first
end

mp.add_hook('on_load', 9, function()
  ---@type string
  local url = mp.get_property('path')
  -- ignore URL with credentials possibly in it
  if not url or url:find('@', 1, true) then
    msg.debug("Found credentials in URL, skipping")
    return
  end
  local pattern = '^https?://([^/]+)(/.*)'
  ---@type string|nil, string|nil
  local subdomain, path = url:match(pattern)
  if not subdomain or not path then
    msg.debug("Path to file is not a URL, skipping")
    return
  end
  ---@cast subdomain string
  local settings = { ['netrc-path'] = os.getenv('HOME') .. '/.netrc' }
  require('mp.options').read_options(settings, 'netrc')
  local netrc_path = settings['netrc-path']
  local netrc = io.open(netrc_path, 'rb')
  if not netrc then
    msg.debug("No .netrc file found, skipping")
    return
  end
  local subdomain_escaped = subdomain:gsub('-', '%%-')
  local netrc_pattern = '^machine ' .. subdomain_escaped .. ' login ([^%s]+) password ([^%s]+)'
  for line in netrc:lines() do
    ---@cast line string
    msg.debug("Reading line: " .. line)
    if line:find(subdomain, 1, true) then
      ---@type string|nil, string|nil
      local user, pass = line:match(netrc_pattern)
      if user and pass then
        ---@cast user string
        ---@cast pass string
        url = 'https://' .. urlencode(user) .. ':' .. urlencode(pass) .. '@' .. subdomain ..
          (path or '')
        msg.info('Adjusted URL with credentials from ~/.netrc')
        mp.set_property('path', url)
        mp.set_property('stream-open-filename', url)
        mp.set_property_native('options/no-ytdl', true)
        mp.set_property_native('options/ytdl', nil) -- Disable youtube-dl
        break
        else
          msg.debug("Could not match one-line `machine` pattern: " .. netrc_pattern)
      end
    else
      msg.debug("Subdomain does not match: " .. subdomain)
    end
  end
  netrc:close()
  msg.debug("Done!")
end)
