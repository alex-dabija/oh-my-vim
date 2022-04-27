local icons = {
  error          = '', -- f658
  warning        = '', -- f071
  hint           = '', -- f0eb
  info           = '', -- f05a
}

local window_max_width = 70

local function hide_if_max_width()
  return vim.fn.winwidth(0) > window_max_width
end

return {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = {
    error = icons.error .. ' ',
    warn = icons.warning .. ' ',
    info = icons.info .. ' ',
    hint = icons.hint .. ' ',
  },
  cond = hide_if_max_width,
}
