local icons = {
  git_add        = '', -- f2ba
  git_modified   = '', -- f459
  git_deleted    = '', -- f458
}

return {
  'diff',
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = {
    added = icons.git_add .. ' ',
    modified = icons.git_modified .. ' ',
    removed = icons.git_deleted .. ' ',
  },
  cond = nil,
}
