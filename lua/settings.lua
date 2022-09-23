local group_file_type_config = 'ft_per_type_config'
vim.api.nvim_create_augroup(group_file_type_config, { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = group_file_type_config,
  pattern = '*',
  callback = function()
    require('filetypes').setup()
  end,
})

local group_tridactyl_files = 'tridactyl_files'
vim.api.nvim_create_augroup(group_tridactyl_files, { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = group_tridactyl_files,
  pattern = '*/tmp/tmp_github.com_*.txt',
  callback = function()
    vim.bo.filetype = 'markdown'
  end
})
