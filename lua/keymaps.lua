local M = {
  GLOBAL_SILENT = {
    opts = { noremap = true, silent = false},
    keys = {
      -- Vim tabs keybindings
      { mode = 'n', lhs = '<Leader>tm', rhs = ':tabmove '                                                             },
      { mode = 'n', lhs = '<Leader>te', rhs = ':tabedit '                                                             },
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
      { mode = 'n', lhs = '<Leader>e',  rhs = '<Cmd>lua vim.diagnostic.open_float()<CR>'                              },
      { mode = 'n', lhs = '[d',         rhs = '<Cmd>lua vim.diagnostic.goto_prev()<CR>'                               },
      { mode = 'n', lhs = ']d',         rhs = '<Cmd>lua vim.diagnostic.goto_next()<CR>'                               },
      { mode = 'n', lhs = '<Leader>q',  rhs = '<Cmd>lua vim.diagnostic.setloclist()<CR>'                              },
      { mode = 'n', lhs = '<Leader>wa', rhs = '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                       },
      { mode = 'n', lhs = '<Leader>wr', rhs = '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                    },
      { mode = 'n', lhs = '<Leader>wl', rhs = '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' },
      { mode = 'n', lhs = 'gf',         rhs = '<Cmd>lua require("utils").lsp_format_file()<CR>'                       },
    },
  },
  LSP_TELESCOPE = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>ca', rhs = ':Telescope lsp_code_actions<CR>'                                       },
      { mode = 'n', lhs = '<Leader>dd', rhs = ':Telescope diagnostics bufnr=0<CR>'                                    },
      { mode = 'n', lhs = '<Leader>wd', rhs = ':Telescope diagnostics<CR>'                                            },
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
      { mode = 'n', lhs = '<Leader>?',  rhs = [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]]                },
    },
  },
  NVIM_SESSION = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>sl', rhs = ':SessionManager load_session<CR>'                                      },
      { mode = 'n', lhs = '<Leader>ss', rhs = ':SessionManager save_current_session<CR>'                              },
      { mode = 'n', lhs = '<Leader>sd', rhs = ':SessionManager delete_session<CR>'                                    },
    },
  },
  NVIM_TREE = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>tt',  rhs = ':NvimTreeToggle<CR>'                                                  },
      { mode = 'n', lhs = '<Leader>tr',  rhs = ':NvimTreeRefresh<CR>'                                                 },
      { mode = 'n', lhs = '<Leader>tn',  rhs = ':NvimTreeFindFile<CR>'                                                },
    },
  },
  VIRTUAL_TEXT = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>tv', rhs = ':LspVirtualTextToggle<CR>'                                             },
    },
  },
  GITSIGNS = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>hs', rhs = '<Cmd>lua require("gitsigns").stage_hunk()<CR>'                         },
      { mode = 'n', lhs = '<Leader>hu', rhs = '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>'                    },
      { mode = 'n', lhs = '<Leader>hr', rhs = '<Cmd>lua require("gitsigns").reset_hunk()<CR>'                         },
      { mode = 'n', lhs = '<Leader>hR', rhs = '<Cmd>lua require("gitsigns").reset_buffer()<CR>'                       },
      { mode = 'n', lhs = '<Leader>hp', rhs = '<Cmd>lua require("gitsigns").preview_hunk()<CR>'                       },
      { mode = 'n', lhs = '<Leader>hb', rhs = '<Cmd>lua require("gitsigns").blame_line()<CR>'                         },
      { mode = 'o', lhs = 'ih',         rhs = ':<C-U>lua require("gitsigns").select_hunk()<CR>'                       },
      { mode = 'x', lhs = 'ih',         rhs = ':<C-U>lua require("gitsigns").select_hunk()<CR>'                       },
    },
  },
  GITSIGNS_NAVIGATION = {
    opts = { noremap = true, silent = true, expr = true },
    keys = {
      { mode = 'n', lhs = ']c',         rhs = "&diff ? ']c' : '<cmd>lua require(\"gitsigns\").next_hunk()<CR>'"       },
      { mode = 'n', lhs = '[c',         rhs = "&diff ? '[c' : '<cmd>lua require(\"gitsigns\").prev_hunk()<CR>'"       },
    },
  },
  BARBAR = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<A-,>',       rhs = ':BufferPrevious<CR>'                                                  },
      { mode = 'n', lhs = '<S-Tab>',     rhs = ':BufferPrevious<CR>'                                                  },
      { mode = 'n', lhs = '<A-.>',       rhs = ':BufferNext<CR>'                                                      },
      { mode = 'n', lhs = '<Tab>',       rhs = ':BufferNext<CR>'                                                      },
      { mode = 'n', lhs = '<A-<>',       rhs = ':BufferMovePrevious<CR>'                                              },
      { mode = 'n', lhs = '<A->>',       rhs = ':BufferMoveNext<CR>'                                                  },
      { mode = 'n', lhs = '<A-1>',       rhs = ':BufferGoto 1<CR>'                                                    },
      { mode = 'n', lhs = '<A-2>',       rhs = ':BufferGoto 2<CR>'                                                    },
      { mode = 'n', lhs = '<A-3>',       rhs = ':BufferGoto 3<CR>'                                                    },
      { mode = 'n', lhs = '<A-4>',       rhs = ':BufferGoto 4<CR>'                                                    },
      { mode = 'n', lhs = '<A-5>',       rhs = ':BufferGoto 5<CR>'                                                    },
      { mode = 'n', lhs = '<A-6>',       rhs = ':BufferGoto 6<CR>'                                                    },
      { mode = 'n', lhs = '<A-7>',       rhs = ':BufferGoto 7<CR>'                                                    },
      { mode = 'n', lhs = '<A-8>',       rhs = ':BufferGoto 8<CR>'                                                    },
      { mode = 'n', lhs = '<A-9>',       rhs = ':BufferGoto 9<CR>'                                                    },
      { mode = 'n', lhs = '<A-0>',       rhs = ':BufferLast<CR>'                                                      },
      { mode = 'n', lhs = '<C-s>',       rhs = ':BufferPick<CR>'                                                      },
      { mode = 'n', lhs = '<Leader>sbd', rhs = ':BufferOrderByDirectory<CR>'                                          },
      { mode = 'n', lhs = '<Leader>sbl', rhs = ':BufferOrderByLanguage<CR>'                                           },
      { mode = 'n', lhs = '<A-c>',       rhs = ':BufferClose<CR>'                                                     },
      { mode = 'n', lhs = '<Leader>co',  rhs = ':BufferCloseAllButCurrent<CR>'                                        },
      { mode = 'n', lhs = '<Leader>cl',  rhs = ':BufferCloseBuffersLeft<CR>'                                          },
      { mode = 'n', lhs = '<Leader>cr',  rhs = ':BufferCloseBuffersRight<CR>'                                         },
      { mode = 'n', lhs = '<Leader>bw',  rhs = ':BufferWipeout<CR>'                                                   },
    },
  },
  TELE_TABBY = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>tf', rhs = '<Cmd>lua require("telescope").extensions.tele_tabby.list({})<CR>'      },
    },
  },
  HOP = {
    opts = { noremap = true, silent = true },
    keys = {
      { mode = 'n', lhs = '<Leader>jl', rhs = ':HopLine<CR>'                                                          },
      { mode = 'o', lhs = '<Leader>jl', rhs = ':HopLine<CR>'                                                          },
      { mode = 'n', lhs = '<Leader>jw', rhs = ':HopWord<CR>'                                                          },
      { mode = 'o', lhs = '<Leader>jw', rhs = ':HopWord<CR>'                                                          },
      { mode = 'n', lhs = '<Leader>jp', rhs = ':HopPattern<CR>'                                                       },
      { mode = 'o', lhs = '<Leader>jp', rhs = ':HopPattern<CR>'                                                       },
      { mode = 'n', lhs = '<Leader>j1', rhs = ':HopChar1<CR>'                                                         },
      { mode = 'o', lhs = '<Leader>j1', rhs = ':HopChar1<CR>'                                                         },
      { mode = 'n', lhs = '<Leader>j2', rhs = ':HopChar2<CR>'                                                         },
      { mode = 'o', lhs = '<Leader>j2', rhs = ':HopChar2<CR>'                                                         },
    },
  },
}

function M.set_keymaps(group)
  local opts = group.opts
  for _, value in ipairs(group.keys) do
    vim.api.nvim_set_keymap(value.mode, value.lhs, value.rhs, opts)
  end
end

function M.set_buf_keymaps(bufnr, group)
  local opts = group.opts
  for _, value in ipairs(group.keys) do
    vim.api.nvim_buf_set_keymap(bufnr, value.mode, value.lhs, value.rhs, opts)
  end
end

return M
