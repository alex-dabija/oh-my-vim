local M = {}

function M.setup()
  vim.api.nvim_exec([[
    augroup osc_yank
      autocmd!
      autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
    augroup end
  ]], false)
end

return M
