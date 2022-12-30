local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local colors = require("onenord.colors").load()

local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end


ins_left {
  'branch',
  icon = '',
  padding = {left = 1 ,right = 1}
}


ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    added = {fg = colors.green},
    modified = {fg = colors.cyan},
  },
  cond = conditions.hide_in_width,
  padding = {left = 1, right = 1}
}

ins_right {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  always_visible = false,
  padding = {left = 1, right = 1}
}

ins_right {
  'filetype',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.light_gray, gui = 'bold' },
}


lualine.setup(config)
