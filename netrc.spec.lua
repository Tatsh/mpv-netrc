---@diagnostic disable: need-check-nil
local function empty() end
package.loaded['mp.msg'] = {info = empty}
package.loaded['mp.options'] = {read_options = function(x) return x end}
local function require_mod(get_property_impl)
  local callback = nil
  local priority = nil
  local when = nil
  _G.mp = {add_hook = spy.new(function(w, prio, cb)
    callback = cb
    priority = prio
    when = w
  end), get_property = spy.new(get_property_impl or
                                 function() return 'https://a:b@example.com/somefile.mp4' end)}
  require('netrc')
  return when, priority, callback
end
local function wrap(f, get_property_impl)
  return function()
    local when, priority, callback = require_mod(get_property_impl)
    f(when, priority, callback)
    package.loaded['netrc'] = nil
  end
end
local function wrap_call(f, get_property_impl)
  return function()
    local when, priority, callback = require_mod(get_property_impl)
    local cb_ret = callback()
    f(cb_ret, when, priority, callback)
    package.loaded['netrc'] = nil
  end
end
local valid_domain = 'valid-url.com'
local function valid_url() return 'https://' .. valid_domain .. '/w.mp4' end
local function getenv_impl() return './' end
local netrc_file = '.netrc'

describe('mpv plugin conformance test', function()
  it('calls mp.add_hook() with correct arguments', wrap(
       function(when, priority, callback)
      assert.is_string(when)
      assert.is_number(priority)
      assert.is_function(callback)
      assert.spy(mp.add_hook).was.called(1)
    end))

  it('returns nil when url has @', wrap_call(function(ret)
    assert.spy(mp.get_property).was.called_with('path')
    assert.is_nil(ret)
  end))

  it('returns nil when not a URL but has an @',
     wrap_call(function(ret) assert.is_nil(ret) end, function() return 'somefile@.mp4' end))

  it('returns nil when URL does not have a path component (due to limitation of Lua RE)',
     wrap_call(function(ret) assert.is_nil(ret) end, function() return 'https://example.com' end))

  it('returns nil when netrc cannot be found', wrap(
       function(_, __, callback)
      os.remove(netrc_file)
      stub(_G.os, 'getenv', getenv_impl)
      local ret = callback()
      ---@diagnostic disable-next-line: param-type-mismatch
      assert.stub(_G.os.getenv).was.called_with('HOME')
      _G.os.getenv:revert()
      assert.is_nil(ret)
    end, valid_url))

  it('does nothing when it cannot find a matching subdomain', wrap(
       function(_, __, callback)
      local f = io.open(netrc_file, 'w+')
      f:write('machine not-match.com\n')
      f:close()
      stub(_G.os, 'getenv', getenv_impl)
      _G.mp.set_property = spy.new(empty)
      callback()
      assert.spy(_G.mp.set_property).was.not_called()
      os.remove(netrc_file)
    end, valid_url))

  it('does nothing when it cannot find a user and password in netrc', wrap(
       function(_, __, callback)
      local f = io.open(netrc_file, 'w+')
      f:write('machine ' .. valid_domain .. ' login   password   \n')
      f:close()
      stub(_G.os, 'getenv', getenv_impl)
      _G.mp.set_property = spy.new(empty)
      callback()
      assert.spy(_G.mp.set_property).was.not_called()
      os.remove(netrc_file)
    end, valid_url))

  it('works when netrc has a matching subdomain and user/pass', wrap(
       function(_, __, callback)
      local f = io.open(netrc_file, 'w+')
      f:write('machine ' .. valid_domain .. ' login a#b password b\n')
      f:close()
      stub(_G.os, 'getenv', getenv_impl)
      _G.mp.set_property = spy.new(empty)
      _G.mp.set_property_native = spy.new(empty)
      callback()
      assert.spy(_G.mp.set_property).was.called(2)
      assert.spy(_G.mp.set_property).was.called_with('stream-open-filename',
                                                     'https://a%23b:b@' .. valid_domain .. '/w.mp4')
      assert.spy(_G.mp.set_property_native).was.called(2)
      os.remove(netrc_file)
    end, valid_url))

  it('reads netrc_path from config and uses the value #s', wrap(
       function(_, __, callback)
      stub(_G.os, 'getenv', getenv_impl)
      local old_options = package.loaded['mp.options']
      local test_settings = {netrc_path = 'test_path'}
      local read_options_impl = spy.new(function() return test_settings end)
      package.loaded['mp.options'] = {read_options = read_options_impl}
      callback()
      assert.spy(read_options_impl).was.called(1)
      assert.spy(read_options_impl).was.returned_with(test_settings)
      package.loaded['mp.options'] = old_options
    end, valid_url))
end)
