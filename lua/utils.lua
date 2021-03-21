local M = {}

local V = vim.api

-- option classification based on type: global, buffer, window
local options = {
  ['list']          = {  true, false,  true },
  ['ruler']         = {  true, false, false },
  ['hidden']        = {  true, false, false },
  ['fileencoding']  = {  true, false, false },
  ['termguicolors'] = {  true, false, false },
}

M.set = function(option, value)
  local o = options[option]
  if o then
    -- set global option
    if o[1] then
      V.nvim_set_option(option, value)
    end

    -- set buffer option
    if o[2] then
      V.nvim_buf_set_option(0, option, value)
    end

    -- set window option
    if o[3] then
      V.nvim_win_set_option(0, option, value)
    end
  else
    error('Option ' .. option .. ' is not configured.')
  end
end

return M
