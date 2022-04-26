if not pcall(require, 'nvim-lightbulb') then
  return
end

vim.fn.sign_define('LightBulbSign', { text = 'ﯦ' })

local group_name = 'lsb_nvim_lightbulb'
vim.api.nvim_create_augroup(group_name, { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = group_name,
  pattern = '*',
  callback = function()
    require('nvim-lightbulb').update_lightbulb()
  end
})
