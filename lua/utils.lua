local M = {}

local V = vim.api

-- option classification based on type: global, buffer, window
local options = {
  ['list']           = {  true, false,  true },
  ['listchars']      = {  true, false, false },
  ['ruler']          = {  true, false, false },
  ['number']         = {  true, false,  true },
  ['relativenumber'] = {  true, false,  true },
  ['colorcolumn']    = {  true, false,  true },
  ['signcolumn']     = {  true, false,  true },
  ['hidden']         = {  true, false, false },
  ['scrolloff']      = {  true, false, false },
  ['lazyredraw']     = {  true, false, false },
  ['fileencoding']   = {  true, false, false },
  ['termguicolors']  = {  true, false, false },
  ['expandtab']      = {  true,  true, false },
  ['tabstop']        = {  true,  true, false },
  ['shiftwidth']     = {  true,  true, false },
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

M.set_colorscheme = function(colorscheme)
  vim.api.nvim_exec([[colorscheme ]] .. colorscheme, false)
end


M.script_path = function()
  return debug.getinfo(2, 'S').source:sub(2)
end

M.sha256sum = function(file, func)
  local lines = {}
  local cmd = vim.fn.expandcmd('sha256sum ' .. file)

  local function on_event(job_id, data, event)
    if event == 'stdout' then
      if data then
        for k, v in pairs(data) do
          local v = vim.trim(v)
          if v ~= '' then
            table.insert(lines, v)
          end
        end
      end
    end

    if event == 'exit' then
      if data == 0 then
        if #lines >= 1 then
          local hash = vim.trim(vim.split(lines[1], ' ')[1])
          func(hash)
        else
          error('There was no output from running \'' .. cmd .. '\'')
        end
      else
        error('An error occurred while running \'' .. cmd .. '\'. Exit code ' .. tostring(data))
      end
    end
  end

  local job_id = vim.fn.jobstart(cmd, {
      on_stderr = on_event,
      on_stdout = on_event,
      on_exit = on_event,
      stdout_buffered = true,
      stdout_buffered = true,
  })
end

M.write_value_to_file = function(file_path, value)
  local file_path = vim.fn.expand(file_path)
  vim.fn.mkdir(vim.fn.fnamemodify(file_path, ':h'), 'p')
  local output_file = io.open(file_path, 'w')
  if output_file then
    output_file:write(value)
    output_file:close()
  else
    error('An error occurred while opening file \'' .. file_path .. '\'')
  end
end

M.read_value_from_file = function(file_path)
  local file_path = vim.fn.expand(file_path)
  local input_file = io.open(file_path, 'r')
  if input_file then
    return input_file:read()
  else
    return ''
  end
end

return M
