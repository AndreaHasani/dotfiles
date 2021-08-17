local map = vim.api.nvim_set_keymap
local cmd = vim.cmd     -- execute Vim commands
local exec = vim.api.nvim_exec       -- execute Vimscript
local fn = vim.fn       -- call Vim functions
local g = vim.g         -- global variables
local o = vim.o         -- global options
local b = vim.bo        -- buffer-scoped options
local w = vim.wo        -- windows-scoped options

-- Globals
g.mapleader = " "
g.loaded_ruby_provider = 1 -- Disable ruby

-- Options
o.clipboard = 'unnamedplus'
o.timeoutlen=200
o.hidden = true
o.history=5000
o.wrap = true
o.pumheight=30
o.sidescroll=1
o.gdefault = true
o.viewdir='~/.vim/view/'
o.viewoptions='cursor,folds,slash,unix'
o.number = true
o.foldmethod='manual'
o.linebreak = true
o.ignorecase = true
o.rnu = true
o.updatetime=300 -- Smaller updatetime for CursorHold & CursorHoldI
o.signcolumn='yes' -- always show signcolumns

-- Tabs config
o.softtabstop=0
o.ts=4
o.shiftwidth=4

cmd[[let @/ = ""]]
cmd[[set expandtab]]
cmd[[set smartindent]]
cmd[[set noswapfile]]
cmd[[set nocursorline]]
cmd[[set noshowmode]]
cmd[[set noshowcmd]]
cmd[[filetype on]]
cmd[[filetype plugin on]]
cmd[[filetype indent on]]
cmd[[set splitbelow]]
cmd[[set autoindent]]
cmd[[set splitright]] -- disable backup
cmd[[set nobackup]] -- disable backup
cmd[[set nowritebackup]] -- disable backup

-- Set colors
o.syntax='on'
cmd[[colorscheme tokyonight]]


---- Autocmd

-- Configure undo

cmd[[set undofile]] -- Enable undo
o.ul = 1000 -- Set undo siez to 1000
if vim.fn.has('nvim') == 1 and vim.fn.has('unix') then
    o.undodir=".nvim/undoHistory/"
else
    o.undodir='.vim/undoHISTORY'
end
