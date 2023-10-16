-- [nfnl] Compiled from fnl/codebeige/scratch.fnl by https://github.com/Olical/nfnl, do not edit.
local function find_buffer(name)
  local buffer = nil
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if buffer then break end
    local _1_, _2_ = pcall(vim.api.nvim_buf_get_var, b, "scratch_buffer_name")
    if ((_1_ == true) and (_2_ == name)) then
      buffer = b
    else
    end
  end
  return buffer
end
local function create_buffer(name, filetype)
  local _4_ = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(_4_, ("[" .. name .. "]"))
  vim.api.nvim_buf_set_var(_4_, "scratch_buffer_name", name)
  vim.api.nvim_buf_set_option(_4_, "filetype", filetype)
  return _4_
end
local function delete_buffer(buffer)
  return vim.api.nvim_buf_delete(buffer, {force = true})
end
local function new_window(buffer, _5_)
  local _arg_6_ = _5_
  local count = _arg_6_["count"]
  local mods = _arg_6_["mods"]
  vim.cmd.split({mods = mods})
  if (0 < count) then
    if mods.vertical then
      vim.api.nvim_win_set_width(0, count)
    else
      vim.api.nvim_win_set_height(0, count)
    end
  else
  end
  vim.api.nvim_win_set_buf(0, buffer)
  local _9_, _10_ = pcall(vim.api.nvim_buf_get_var, buffer, "scratch_buffer_view")
  if ((_9_ == true) and (nil ~= _10_)) then
    local view = _10_
    return vim.fn.winrestview(view)
  else
    return nil
  end
end
local function save_layout(buffer, window)
  return vim.api.nvim_buf_set_var(buffer, "scratch_buffer_view", vim.api.nvim_win_call(window, vim.fn.winsaveview))
end
local function close_windows(windows)
  for _, w in ipairs(windows) do
    vim.api.nvim_win_close(w, true)
  end
  return nil
end
local function toggle_window(name, _12_)
  local _arg_13_ = _12_
  local count = _arg_13_["count"]
  local filetype = _arg_13_["filetype"]
  local mods = _arg_13_["mods"]
  local purge_3f = _arg_13_["purge?"]
  local buffer = find_buffer(name)
  local _let_14_ = vim.fn.win_findbuf(buffer)
  local window = _let_14_[1]
  local windows = _let_14_
  if (buffer and purge_3f) then
    delete_buffer(buffer)
  else
  end
  if not window then
    local buffer0
    local function _16_()
      if not purge_3f then
        return buffer
      else
        return nil
      end
    end
    buffer0 = (_16_() or create_buffer(name, filetype))
    return new_window(buffer0, {count = count, mods = mods})
  else
    if not purge_3f then
      save_layout(buffer, window)
      return close_windows(windows)
    else
      return nil
    end
  end
end
local function init()
  local function _22_(_19_)
    local _arg_20_ = _19_
    local bang = _arg_20_["bang"]
    local count = _arg_20_["count"]
    local _arg_21_ = _arg_20_["fargs"]
    local name = _arg_21_[1]
    local filetype = _arg_21_[2]
    local more = (function (t, k, e) local mt = getmetatable(t) if 'table' == type(mt) and mt.__fennelrest then return mt.__fennelrest(t, k) elseif e then local rest = {} for k, v in pairs(t) do if not e[k] then rest[k] = v end end return rest else return {(table.unpack or unpack)(t, k)} end end)(_arg_21_, 3)
    local mods = _arg_20_["smods"]
    assert(vim.tbl_isempty(more), "Too many arguments for command: Scratch")
    local name0 = (name or "scratch")
    return toggle_window(name0, {count = count, filetype = (filetype or vim.filetype.match({filename = name0}) or vim.api.nvim_buf_get_option(0, "filetype") or "text"), mods = mods, ["purge?"] = bang})
  end
  return vim.api.nvim_create_user_command("Scratch", _22_, {bang = true, count = 0, nargs = "*"})
end
return {init = init}
