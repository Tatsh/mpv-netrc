local msg = require 'mp.msg'

mp.add_hook('on_load', 9, function()
  local url = mp.get_property('path')
  -- ignore URL with credentials possibly in it
  if not url or url:find('@', 1, true) then
    return
  end
  local pattern = '^https?://([^/]+)(/.*)'
  local subdomain, path = url:match(pattern)
  if not subdomain or not path then
    return
  end
  local netrc_pattern = '^machine ' .. subdomain .. ' login ([^%s]+) password ([^%s]+)'
  local home = os.getenv('HOME')
  local netrc_path = home .. '/.netrc'
  local netrc = io.open(netrc_path, 'rb')
  if not netrc then
    return
  end
  for line in netrc:lines() do
    if line:find(subdomain, 1, true) then
      local user, pass = line:match(netrc_pattern)
      local url = 'https://' .. user .. ':' .. pass .. '@' .. subdomain .. path
      msg.info('Adjusted URL with credentials from ~/.netrc')
      mp.set_property_native('options/ytdl', nil) -- Disable youtube-dl
      mp.set_property_native('options/no-ytdl', true)
      mp.set_property('path', url)
      mp.set_property('stream-open-filename', url)
      break
    end
  end
  netrc:close()
end)
