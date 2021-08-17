-----------------------------------------------------------
-- Keymapping
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
-- init.lua
--
--

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd     -- execute Vim commands
local exec = vim.api.nvim_exec       -- execute Vimscript
local fn = vim.fn       -- call Vim functions
local g = vim.g         -- global variables
local o = vim.o         -- global options
local b = vim.bo        -- buffer-scoped options
local w = vim.wo        -- windows-scoped options

map('i', 'jj', '<Esc>', {})
map('n', '<S-k>', 'i<enter><Esc>', {noremap=true})

-- Plugins mapping
map('n', '-', ':Fern . -reveal=%<cr>', {})
map('n', '_', ':Fern %:h<cr>', {})
map('n', '<Leader><Leader>', ':e#<CR>', {noremap=true})
map('n', 'gF', ':cd <c-r><c-f><cr>', {noremap=true}) -- Set Working Directory to folder , like gf but for folders
map('n', '<C-w>f', ':MaximizerToggle<cr>', {noremap=true})
map('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})


-- Buffer navigation
map('n', '<C-l>', ':BufferLineCycleNext<CR>', {})
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', {})
map('n', '<C-j>', ':bd!<cr> :echo "Buffer Deleted"<cr>', {noremap=true})
map('n', '<C-k>', ':set ro!<cr> :echo "Set Readonly Toggle"<cr>', {noremap=true})


-- Split resizer map
g.winresizer_start_key =  '<C-W>r'

cmd(
[[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev share Share
cnoreabbrev w w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev tn tabnew
cnoreabbrev tc tabclose
cnoreabbrev notes Notes
]]
)
