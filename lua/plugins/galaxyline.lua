local M = {}

local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local provider = {
  lsp = require('galaxyline.providers.lsp'),
  vcs = require('galaxyline.providers.vcs'),
  fileinfo = require('galaxyline.providers.fileinfo')
}

gl.short_line_list = {'', 'packer', 'vim-plug', 'tagbar', 'Mundo', 'MundoDiff', 'coc-explorer', 'startify', 'NvimTree'}

local window_names = {
  ['']         = '[No File Type]',
  ['packer']   = 'Packer',
  ['NvimTree'] = 'File Explorer',
}

-- onedark
local palette = {
  red            = '#E06C75',
  dark_red       = '#BE5046',
  green          = '#98C379',
  yellow         = '#E5C07B',
  dark_yellow    = '#D19A66',
  blue           = '#61AFEF',
  purple         = '#C678DD',
  cyan           = '#56B6C2',
  white          = '#ABB2BF',
  black          = '#282C34',
  visual_black   = 'NONE',
  comment_grey   = '#5C6370',
  gutter_fg_grey = '#4B5263',
  cursor_grey    = '#2C323C',
  visual_grey    = '#3E4452',
  menu_grey      = '#3E4452',
  special_key    = '#3B4048',
  vertsplit      = '#181A1F',
}

local colors = {
  mode_normal_fg  = palette.black,
  mode_normal_bg  = palette.green,
  mode_insert_fg  = palette.black,
  mode_insert_bg  = palette.blue,
  mode_replace_fg = palette.black,
  mode_replace_bg = palette.red,
  mode_visual_fg  = palette.black,
  mode_visual_bg  = palette.purple,
  mode_command_fg = palette.black,
  mode_command_bg = palette.dark_yellow,
  mode_unknown_fg = '#FF1493',
  mode_unknown_bg = '#FFFFFF',

  fileinfo_fg     = palette.white;
  fileinfo_bg     = palette.visual_grey;

  git_icon_fg     = palette.red;
  git_info_fg     = palette.white;
  git_info_bg     = palette.black;
  git_added_fg    = palette.green;
  git_modified_fg = palette.yellow;
  git_removed_fg  = palette.red;

  lsp_info_fg      = palette.white;
  lsp_info_bg      = palette.black;
  lsp_connected_fg = palette.green;

  lsp_diagnostic_error_fg   = palette.red;
  lsp_diagnostic_warning_fg = palette.yellow;
  lsp_diagnostic_hint_fg    = palette.green;
  lsp_diagnostic_info_fg    = palette.blue;
}

local separators = {
  right_filled = '', -- e0b2
  left_filled  = '', -- e0b0
  right        = '', -- e0b3
  left         = '', -- e0b1
}

local icons = {
  locker         = '', -- f023
  not_modifiable = '', -- f05e
  unsaved        = '', -- f0c7
  pencil         = '', -- f040
  dos            = '', -- e70f
  unix           = '', -- f17c
  mac            = '', -- f179
  page           = '☰', -- 2630
  line_number    = '', -- e0a1
  connected      = '', -- f817
  disconnected   = '', -- f818
  error          = '', -- f658
  warning        = '', -- f071
  hint           = '', -- f0eb
  info           = '', -- f05a
  git            = '', -- e725
  git_add        = '', -- f2ba
  git_modified   = '', -- f459
  git_deleted    = '', -- f458
  paste          = '', -- f691
}

local Mode = {
  new = function(label, fg, bg)
    return {
      label = label,
      fg = fg,
      bg = bg,
    }
  end
}

local modes = {
  data = {
    ['n']  = Mode.new('NORMAL',   colors.mode_normal_fg,  colors.mode_normal_bg),
    ['i']  = Mode.new('INSERT',   colors.mode_insert_fg,  colors.mode_insert_bg),
    ['R']  = Mode.new('REPLACE',  colors.mode_replace_fg, colors.mode_replace_bg),
    ['v']  = Mode.new('VISUAL',   colors.mode_visual_fg,  colors.mode_visual_bg),
    ['V']  = Mode.new('V-LINE',   colors.mode_visual_fg,  colors.mode_visual_bg),
    [''] = Mode.new('V-BLOCK',  colors.mode_visual_fg,  colors.mode_visual_bg),
    ['c']  = Mode.new('COMMAND',  colors.mode_command_fg, colors.mode_command_bg),
    ['s']  = Mode.new('SELECT',   colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['S']  = Mode.new('S-LINE',   colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['t']  = Mode.new('TERMINAL', colors.mode_unknown_fg, colors.mode_unknown_bg),
    [''] = Mode.new('S-BLOCK',  colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['Rv'] = Mode.new('VIRTUAL',  colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['rm'] = Mode.new('--MORE',   colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['no'] = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['ic'] = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['cv'] = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['ce'] = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['r']  = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['r?'] = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
    ['!']  = Mode.new('N/A',      colors.mode_unknown_fg, colors.mode_unknown_bg),
  },
  default = Mode.new('N/A', colors.mode_unknown_fg, colors.mode_unknown_bg),
  current_mode = function(self)
    return self.data[vim.fn.mode()] or self.default
  end,
}

local function register_event_handlers()
  vim.api.nvim_exec([[
    augroup stagate_galaxyline_theme
      autocmd!
      autocmd ColorScheme * lua require('plugins.galaxyline').init_theme()
    augroup end
  ]], false)
end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then
    cmd = cmd .. ' gui=' .. gui
  end
  vim.api.nvim_exec(cmd, false)
end

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

local function should_display_git_info()
  return condition.check_git_workspace() and wide_enough(85)
end

local function diagnostic_exists()
  return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function is_special_window()
  return vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1
end

local function get_special_window_name()
  local file_type = vim.bo.filetype
  return window_names[file_type] or file_type
end

local my_providers = {}

function my_providers.vi_mode()
  local mode = modes:current_mode()
  highlight('GalaxyViMode', mode.fg, mode.bg, 'bold')
  highlight('GalaxyViModeInv', mode.bg, colors.fileinfo_bg)
  return string.format('  %s ', mode.label)
end

function my_providers.file_icon()
  if is_special_window() then return '' end
  local fg = provider.fileinfo.get_file_icon_color()
  highlight('GalaxyFileIcon', fg, colors.fileinfo_bg)
  return ' ' .. provider.fileinfo.get_file_icon()
end

function my_providers.file_name()
  if is_special_window() then return get_special_window_name() end
  local fname
  if wide_enough(120) then
    fname = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
  else
    fname = vim.fn.expand '%:t'
  end
  if #fname == 0 then return '' end
  if vim.bo.readonly then
    fname = fname .. ' ' .. icons.locker
  end
  if not vim.bo.modifiable then
    fname = fname .. ' ' .. icons.not_modifiable
  end
  if vim.bo.modified then
    fname = fname .. ' ' .. icons.pencil
  end
  return ' ' .. fname .. ' '
end

function my_providers.paste()
  if vim.o.paste then return 'Paste ' end
  return ''
end

function my_providers.git_icon()
  if should_display_git_info() then
    return string.format(' %s ', icons.git)
  end
  return ''
end

function my_providers.git_branch()
  if should_display_git_info() then
    local branch = provider.vcs.get_git_branch()
    if branch then
      return branch .. ' '
    end
    return ''
  end
  return ''
end

function my_providers.lsp_status()
  local connected = diagnostic_exists()
  if connected then
    return '  ' .. icons.connected .. ' '
  end
  return ''
end

function my_providers.lsp_client()
  return ' ' .. provider.lsp.get_lsp_client('') .. ' '
end

function my_providers.right_nested_separator()
  if is_special_window() then return '' end
  return separators.right_filled
end

function my_providers.file_format()
  if is_special_window() then return '' end
  if not condition.buffer_not_empty() or not wide_enough(70) then
    return ''
  end
  local icon = icons[vim.bo.fileformat] or ''
  return string.format('  %s %s ', icon, vim.bo.fileencoding)
end

function my_providers.right_separator()
  if is_special_window() then return '' end
  return separators.right
end

function my_providers.position_info()
  if is_special_window() then return '' end
  if not condition.buffer_not_empty() or not wide_enough(60) then
    return ''
  end
  return string.format('  %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
end

function my_providers.percent_info()
  if is_special_window() then return '' end
  if not condition.buffer_not_empty() or not wide_enough(65) then
    return ''
  end
  local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
  return string.format(' %s %s%s', icons.page, percent, '% ')
end

function M.init_theme()
  highlight('GalaxyFileInfo', colors.fileinfo_fg, colors.fileinfo_bg)
  highlight('GalaxyFileInfoInv', colors.fileinfo_fg, colors.fileinfo_bg)
  highlight('GalaxyFileInfoSeparator', colors.fileinfo_bg, colors.git_info_bg)
  highlight('GalaxyGitInfo', colors.git_info_fg, colors.git_info_bg)
end

function M.setup()
  register_event_handlers()

  gls.left = {{
    ViMode = {
      provider = my_providers.vi_mode,
      separator = separators.left_filled,
      separator_highlight = 'GalaxyViModeInv',
    }}, {
    FileIcon = {
      provider = my_providers.file_icon,
    }}, {
    FileName = {
      provider = my_providers.file_name,
      highlight = 'GalaxyFileInfo',
      separator = separators.left_filled,
      separator_highlight = 'GalaxyFileInfoSeparator',
    }}, {
    Paste = {
      provider = my_providers.paste,
      icon = string.format(' %s ', icons.paste),
      highlight = 'GalaxyGitInfo',
    }}, {
    GitIcon = {
      provider = my_providers.git_icon,
      highlight = {colors.git_icon_fg, colors.git_info_bg},
    }}, {
    GitBranch = {
      provider = my_providers.git_branch,
      highlight = 'GalaxyGitInfo',
    }}, {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = condition.hide_in_width,
      icon = icons.git_add .. ' ',
      highlight = {colors.git_added_fg, colors.git_info_bg},
    }}, {
    DiffModified = {
      provider = 'DiffModified',
      condition = condition.hide_in_width,
      icon = icons.git_modified .. ' ',
      highlight = {colors.git_modified_fg, colors.git_info_bg},
    }}, {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = condition.hide_in_width,
      icon = icons.git_deleted .. ' ',
      highlight = {colors.git_removed_fg, colors.git_info_bg},
    }},
  }

  gls.right = {{
    LspStatus = {
      provider = my_providers.lsp_status,
      highlight = {colors.lsp_connected_fg, colors.git_info_bg},
    }}, {
    ShowLspClient = {
      provider = my_providers.lsp_client,
      condition = function()
        local tbl = {['dashboard'] = true, [' '] = true}
        if tbl[vim.bo.filetype] then return false end
        return true
      end,
      highlight = {colors.lsp_info_fg, colors.lsp_info_bg},
    }}, {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = string.format('%s ', icons.error),
      highlight = {colors.lsp_diagnostic_error_fg, colors.lsp_info_bg},
    }}, {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = string.format('%s ', icons.warning),
      highlight = {colors.lsp_diagnostic_warning_fg, colors.lsp_info_bg},
    }}, {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = string.format('%s ', icons.hint),
      highlight = {colors.lsp_diagnostic_hint_fg, colors.lsp_info_bg},
    }}, {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = string.format('%s ', icons.info),
      highlight = {colors.lsp_diagnostic_info_fg, colors.lsp_info_bg},
    }}, {
    RightSeparatorNested = {
      provider = my_providers.right_nested_separator,
      highlight = 'GalaxyFileInfoSeparator',
    }}, {
    FileFormat = {
      provider = my_providers.file_format,
      highlight = 'GalaxyFileInfo',
    }}, {
    RightSeparator = {
      provider = my_providers.right_separator,
      highlight = 'GalaxyFileInfo',
    }}, {
    PositionInfo = {
      provider = my_providers.position_info,
      highlight = 'GalaxyFileInfo',
    }}, {
    PercentInfo = {
      provider = my_providers.percent_info,
      highlight = 'GalaxyViMode',
      separator = separators.right_filled,
      separator_highlight = 'GalaxyViModeInv',
    }},
  }

  gls.short_line_left = {{
    SFileIcon = {
      provider = my_providers.file_icon,
      highlight = 'GalaxyFileInfo',
    }}, {
    SFileName = {
      provider = my_providers.file_name,
      highlight = 'GalaxyFileInfo',
      separator = separators.left_filled,
      separator_highlight = 'GalaxyFileInfoSeparator',
    }},
  }

  gls.short_line_right = {{
    SRightSeparatorNested = {
      provider = my_providers.right_nested_separator,
      highlight = 'GalaxyFileInfoSeparator',
    }}, {
    SFileFormat = {
      provider = my_providers.file_format,
      highlight = 'GalaxyFileInfo',
    }}, {
    SRightSeparator1 = {
      provider = my_providers.right_separator,
      highlight = 'GalaxyFileInfo',
    }}, {
    SPositionInfo = {
      provider = my_providers.position_info,
      highlight = 'GalaxyFileInfo',
    }}, {
    SRightSeparator2 = {
      provider = my_providers.right_separator,
      highlight = 'GalaxyFileInfo',
    }}, {
    SPercentInfo = {
      provider = my_providers.percent_info,
      highlight = 'GalaxyFileInfo',
    }},
  }
end

return M
