vim.cmd([[
  colorscheme ayu-dark
  highlight Normal guibg=None ctermbg=None
  highlight SignColumn guibg=None ctermbg=None
  highlight LineNr guibg=None ctermbg=None
  highlight Comment gui=italic cterm=italic
  highlight TSProperty gui=italic cterm=italic
  highlight TSType gui=italic cterm=italic
  "
  " " Enable true color 启用终端24位色
  " if exists('+termguicolors')
  "   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "   set termguicolors
  " endif
]])

vim.g.mapleader = " "
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.autoread = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.scrolloff = 999
vim.opt.undolevels = 500
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.linebreak = true
vim.opt.dir = vim.env.HOME .. "/.config/nvim/swap//"
vim.opt.backupdir = vim.env.HOME .. "/.config/nvim/backup//"
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.config/nvim/undo//"
vim.opt.lazyredraw = true
vim.opt.virtualedit = "block,onemore"
vim.opt.joinspaces = false
vim.opt.breakindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.gdefault = true

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.signcolumn = "number"

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevelstart = 99

-- Editing
vim.opt.backspace = "indent,eol,start"
vim.opt.updatetime = 500

-- Python
vim.g.python_host_skip_check = 1
vim.g.python3_host_prog = "python3"
vim.g.python_host_prog = "python2"
