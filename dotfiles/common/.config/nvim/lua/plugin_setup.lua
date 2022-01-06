--- Variables
--

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd     -- execute Vim commands
local exec = vim.api.nvim_exec       -- execute Vimscript
local fn = vim.fn       -- call Vim functions
local g = vim.g         -- global variables
local o = vim.o         -- global options
local b = vim.bo        -- buffer-scoped options
local w = vim.wo        -- windows-scoped options

--- Vista plugin setup
--

g.vista_default_executive = 'ctags'
g.vista_sidebar_width = '50'
g['vista#renderer#enable_icon'] = 1


--- Formatter plugin start
--

require('formatter').setup({
  logging = false,
  filetype = {
    python = {
        -- prettier
       function()
          return {
            exe = "black",
            args = {"-"},
            stdin = true
          }
        end
    },
  }
})

--- Pears plugin start

require "pears".setup()


--- lsp signature plugin start

require'lsp_signature'.on_attach()


--- Dervish config
--

cmd[[let g:dirvish_mode = ':sort ,^.*[\/],']]
g.drivish_relative_paths = 1

function _G.DirvishMapping()
	vim.api.nvim_buf_set_keymap(0, 'n', 'c', 'cd %<cr> :echo "Changing directory to %<cr>"', {})
	vim.api.nvim_buf_set_keymap(0, 'n', 'h', '-', {})
	vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<cr>', {})
end

cmd([[
augroup netrw_mappings
au!
au filetype dirvish lua DirvishMapping()
augroup END
]])


-- Lsp diagnostic setup
--

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)


vim.cmd [[ sign define LspDiagnosticsSignError text=x texthl=LspDiagnosticsSignError linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsDefaultError text=x texthl=LspDiagnosticsDefaultError linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl= ]]


-- Treesitter plugin start
--

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   ignore_install = {  }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = {},  -- list of language that will be disabled
--   },
-- }


-- lspconfig plugin start
--

require'lspconfig'.pyright.setup{
    on_init = function(client)
        client.config.flags = {}
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
    end;
}


-- Compe (automcomplete) plugin start
--

vim.o.completeopt="menuone,noinsert"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    buffer = true;
  };
}

-- Telescope plugin setup
--

local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == "text" then
          vim.loop.fs_stat(filepath, function(_, stat)
            if not stat then return end
            if stat.size > 100000 then
              return
            else
              previewers.buffer_previewer_maker(filepath, bufnr, opts)
            end
          end)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
  end

local actions = require('telescope.actions')
require('telescope').setup{
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--max-filesize=50K',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-S>j"] = actions.preview_scrolling_down,
                ["<C-S>k"] = actions.preview_scrolling_up,
            },
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.7
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = new_maker
    }
}

require('telescope').load_extension('fzf') -- Calling after telescope setup

-- Whichkey plugin setup
--

require("which-key").setup {
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 1, 6 }, -- extra window padding [top, right, bottom, left]
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
}


local wk = require("which-key")
wk.register({
  f = {
    name = "Find", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Grep Files" }, -- create a binding with label
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Lsp Symbols/Tags Searcher" }, -- create a binding with label
    b = { "<cmd>Telescope buffers<cr>", "Switch Buffers" }, -- create a binding with label
  },
  e = {
    name = "Editor Options", -- optional group name
  },
  w = {
    name = "Window", -- optional group name
    u = { ":UndotreeToggle<cr>:UndotreeFocus<cr>", "Undo Panel" },
    v = { ":Vista!!<cr>", "Symbols/Tags Panel" },
    f = { ":NvimTreeToggle<cr>", "File Manager Panel" },
  },
  d = {
    name = "Debugging", -- optional group name
    l = { "<Cmd>Trouble lsp_document_diagnostics<CR>", "Linted Issues List" },
  },
  g = {
    name = "Go to", -- optional group name
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Function Declaration" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Function Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Function Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Function References" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Function Help" },
  },
    c = { ":DogeGenerate<CR>", "Generate DocString" },
}, { prefix = "<leader>" })


-- Trouble plugin start
--

require("trouble").setup {
	position = "bottom", -- position of the list can be: bottom, top, left, right
	height = 10, -- height of the trouble list when position is top or bottom
	width = 50, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	action_keys = { -- key mappings for actions in the trouble list
	close = "q", -- close the list
	cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
	refresh = "r", -- manually refresh
	jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
	open_split = { "<c-x>" }, -- open buffer in new split
	open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
	open_tab = { "<c-t>" }, -- open buffer in new tab
	jump_close = {"o"}, -- jump to the diagnostic and close the list
	toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
	toggle_preview = "P", -- toggle auto_preview
	hover = "K", -- opens a small poup with the full multiline message
	preview = "p", -- preview the diagnostic location
	close_folds = {"zM", "zm"}, -- close all folds
	open_folds = {"zR", "zr"}, -- open all folds
	toggle_fold = {"zA", "za"}, -- toggle fold of current file
	previous = "k", -- preview item
	next = "j" -- next item
},
indent_lines = true, -- add an indent guide below the fold icons
auto_open = false, -- automatically open the list when you have diagnostics
auto_close = false, -- automatically close the list when you have no diagnostics
auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
auto_fold = false, -- automatically fold a file trouble list at creation
signs = {
	-- icons / text used for a diagnostic
	error = "",
	warning = "",
	hint = "",
	information = "",
	other = "﫠"
},
use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}


-- lspkind plugin start
--

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})



-- Bufferline plugin start
--

require('bufferline').setup {
  options = {
    numbers = "ordinal",
    number_style = "superscript",
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  }
}

-- Bufferline plugin end
--


-- lualine plugin start
--

require('lualine').setup{
	options={
		theme='modus_vivendi',
		section_separators = '',
		component_separators = '',
	},
}

-- lualine plugin end
--

-- Fern plugin start
--

exec([[
g:fern#disable_drawer_smart_quit = 1

function! Init_fern() abort
  " Quit fern
  nmap <buffer> q :e#<CR>
  nmap <buffer> - :e#<CR>
  nmap <buffer> H <Plug>(fern-action-leave)

endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call Init_fern()
augroup END
]], true)


-- Fern plugin End


-- TogleTerm plugin start
--

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 15,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
}

-- TogleTerm plugin end
--
