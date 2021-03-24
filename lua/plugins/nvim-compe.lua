local M = {}

local utils = require('utils')

function M.setup()
  -- autocompletion menu behaviour
  utils.set('completeopt', 'menuone,noselect')

  require('compe').setup {
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = false,
    }
  }

  local opts = {noremap = true, silent = true, expr = true}
  vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', opts)
  vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', opts)
  vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', opts)
  vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({"delta": +4})', opts)
  vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({"delta": -4})', opts)

  vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', opts)
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', opts)
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local is_popup_visible = function()
  return vim.fn.pumvisible() == 1
end

_G.tab_complete = function()
  if is_popup_visible() then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if is_popup_visible() then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end

return M