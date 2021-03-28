local M = {
  GLOBAL = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<C-Up>',    rhs = ':resize -2<CR>'                                                         },
      { mode = 'n', lhs = '<C-Down>',  rhs = ':resize +2<CR>'                                                         },
      { mode = 'n', lhs = '<C-Left>',  rhs = ':vertical resize -2<CR>'                                                },
      { mode = 'n', lhs = '<C-Right>', rhs = ':vertical resize +2<CR>'                                                },
    },
  },
  LSP = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = 'gD',         rhs = '<Cmd>lua vim.lsp.buf.declaration()<CR>'                                },
      { mode = 'n', lhs = 'gd',         rhs = '<Cmd>lua vim.lsp.buf.definition()<CR>'                                 },
      { mode = 'n', lhs = 'K',          rhs = '<Cmd>lua vim.lsp.buf.hover()<CR>'                                      },
      { mode = 'n', lhs = 'gi',         rhs = '<Cmd>lua vim.lsp.buf.implementation()<CR>'                             },
      { mode = 'n', lhs = '<C-k>',      rhs = '<Cmd>lua vim.lsp.buf.signature_help()<CR>'                             },
      { mode = 'n', lhs = '<Leader>D',  rhs = '<Cmd>lua vim.lsp.buf.type_definition()<CR>'                            },
      { mode = 'n', lhs = '<Leader>rn', rhs = '<Cmd>lua vim.lsp.buf.rename()<CR>'                                     },
      { mode = 'n', lhs = 'gr',         rhs = '<Cmd>lua vim.lsp.buf.references()<CR>'                                 },
      { mode = 'n', lhs = '<Leader>e',  rhs = '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'               },
      { mode = 'n', lhs = '[d',         rhs = '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'                           },
      { mode = 'n', lhs = ']d',         rhs = '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>'                           },
      { mode = 'n', lhs = '<Leader>q',  rhs = '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'                         },
      { mode = 'n', lhs = '<Leader>wa', rhs = '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                       },
      { mode = 'n', lhs = '<Leader>wr', rhs = '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                    },
      { mode = 'n', lhs = '<Leader>wl', rhs = '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' },
    },
  },
  LSP_TELESCOPE = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>ca', rhs = ':Telescope lsp_code_actions<CR>'                                       },
      { mode = 'n', lhs = '<Leader>dd', rhs = ':Telescope lsp_document_diagnostics<CR>'                               },
      { mode = 'n', lhs = '<Leader>wd', rhs = ':Telescope lsp_workspace_diagnostics<CR>'                              },
      { mode = 'n', lhs = '<Leader>ds', rhs = ':Telescope lsp_document_symbols<CR>'                                   },
      { mode = 'n', lhs = '<Leader>ws', rhs = ':Telescope lsp_workspace_symbols<CR>'                                  },
      { mode = 'n', lhs = 'gd',         rhs = ':Telescope lsp_definitions<CR>'                                        },
      { mode = 'n', lhs = 'gr',         rhs = ':Telescope lsp_references<CR>'                                         },
    },
  },
  TELESCOPE  = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>ff', rhs = ':Telescope find_files<CR>'                                             },
      { mode = 'n', lhs = '<Leader>fg', rhs = ':Telescope live_grep<CR>'                                              },
      { mode = 'n', lhs = '<Leader>fb', rhs = ':Telescope buffers<CR>'                                                },
      { mode = 'n', lhs = '<Leader>fh', rhs = ':Telescope help_tags<CR>'                                              },
      { mode = 'n', lhs = '<Leader>fm', rhs = ':Telescope marks<CR>'                                                  },
      { mode = 'n', lhs = '<Leader>fr', rhs = ':Telescope registers<CR>'                                              },
      { mode = 'n', lhs = '<Leader>ft', rhs = ':Telescope treesitter<CR>'                                             },
      { mode = 'n', lhs = '<Leader>fo', rhs = ':Telescope vim_options<CR>'                                            },
      { mode = 'n', lhs = '<Leader>fk', rhs = ':Telescope keymaps<CR>'                                                },
    },
  },
  NVIM_TREE = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>tt',  rhs = ':NvimTreeToggle<CR>'                                                  },
    },
  },
  COMPE = {
    opts = { noremap = true, silent = true, expr = true },
    keys = {
      { mode = 'i', lhs = '<C-Space>', rhs = 'compe#complete()'                                                       },
      { mode = 'i', lhs = '<CR>',      rhs = 'compe#confirm("<CR>")'                                                  },
      { mode = 'i', lhs = '<C-e>',     rhs = 'compe#close("<C-e>")'                                                   },
      { mode = 'i', lhs = '<C-f>',     rhs = 'compe#scroll({"delta": +4})'                                            },
      { mode = 'i', lhs = '<C-d>',     rhs = 'compe#scroll({"delta": -4})'                                            },
    },
  },
  TABS_COMPE = {
    opts = { noremap = true, silent = true, expr = true },
    keys = {
      { mode = 'i', lhs = '<Tab>',   rhs = 'v:lua.tab_complete()'                                                     },
      { mode = 'i', lhs = '<S-Tab>', rhs = 'v:lua.s_tab_complete()'                                                   },
    },
  },
  VIRTUAL_TEXT = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>tv', rhs = ':LspVirtualTextToggle<CR>'                                             },
    },
  },
}

function M.set_keymaps(group)
  local opts = group.opts
  for i, value in ipairs(group.keys) do
    vim.api.nvim_set_keymap(value.mode, value.lhs, value.rhs, opts)
  end
end

return M
