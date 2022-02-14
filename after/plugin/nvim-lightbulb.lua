if not pcall(require, 'nvim-lightbulb') then
  return
end

vim.fn.sign_define('LightBulbSign', { text = 'ﯦ' })

vim.api.nvim_exec([[
  augroup lsb_nvim_lightbulb
    autocmd!
    autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
  augroup END
]], false)
