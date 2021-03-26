local M = {}

function M.setup()
  vim.fn.sign_define('LightBulbSign', { text = 'ﯦ' })

  vim.api.nvim_exec([[
    augroup lsb_nvim_lightbulb
      autocmd!
      autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    augroup END
  ]], false)
end

return M
