" Map Leader <Has to be first line>
let mapleader = " "
let g:mapleader = " "

set nocompatible

" Sane Defaults
filetype on
filetype plugin on
filetype indent on
set splitbelow
set splitright
set autoindent
" set title
set hidden
set lazyredraw
set history=5000
set noswapfile
set wrap
set gdefault
set re=1
set mouse=
set viewdir=~/.vim/view/
set viewoptions=cursor,folds,slash,unix
set foldmethod=manual
set ignorecase
set linebreak
set smartcase
set noshowmode
" set nu
set rnu
set clipboard=unnamedplus
let @/ = ""

""" Vivid Config

call plug#begin('~/.config/nvim/plugins')

" Window Split Plugins
Plug 'simeji/winresizer'

" Align Plugins
Plug 'junegunn/vim-easy-align'

" ColorScheme
Plug 'owickstrom/vim-colors-paramount'

" Interface Plugins
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
if has ('unix')
    Plug 'junegunn/fzf'
endif
Plug 'Yggdroot/IndentLine'
Plug 'ap/vim-buftabline'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'ferranpm/vim-isolate'

" Local Win Plugins
if has ('win32')
    Plug '~/.vim/plugins/local/restore_view'
    " Plug '~/.vim\plugins\local\statusline'
else
    " Plug '~/.config/nvim/plugins/local/restore_view'
endif

" Local Unix Plugins
 " if has ("unix")
 "     " Session Plugin Local
 "     call vivid#local'/home/strixx/.config/nvim/plugins/repos/github.com/vim-scripts/'
 " endif

" Code Completion Plugin
Plug 'Shougo/echodoc.vim'

" Code Completion Plugin
Plug 'aserebryakov/vim-todo-lists'

" Plug 'mattn/emmet-vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" Plug 'ajh17/VimCompletesMe'
" Plug 'maralla/completor.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-syntax'
Plug 'metakirby5/codi.vim'
" Plug 'ervandew/supertab'


" Automaticly Features Plugin
Plug 'jamessan/vim-gnupg'
" Plug 'tmhedberg/SimpylFold'
" Plug 'b4b4r07/vim-sunset'
Plug 'pgdouyon/vim-evanesco'

" Benchmark Plugin
Plug 'tweekmonster/startuptime.vim'

" Tags
Plug 'majutsushi/tagbar'
" Plug 'jsfaint/gen_tags.vim'

" Commands Plugin
if has ('unix')
    Plug 'mhinz/vim-grepper'
endif
Plug 'sbdchd/neoformat'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'andrewradev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

" Intergrations Plugin
Plug 'tpope/vim-commentary'
" Plug 'mileszs/ack.vim'
Plug 'keith/gist.vim'
Plug 'javier-lopez/sprunge.vim'

" Language Plugin
" Plug 'sheerun/vim-polyglot'
Plug '2072/PHP-Indenting-for-VIm'

"" Language Specific

" Plug 'autozimu/LanguageClient-neovim',, {
"     \ 'rev': 'next',
"     \ 'build': 'bash install.sh',
"     \ }


" Python

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'kh3phr3n/python-syntax'
Plug 'zchee/deoplete-jedi'



" Improvments Plugins
" Plug 'bkad/camelcasemotion'
Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/vis'
" Plug "andymass/vim-matchup"
Plug 'kana/vim-smartword'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-ragtag'
Plug 'xtal8/traces.vim'
Plug 'seavan/BufOnly.vim'


" Syntax Check Plugin
Plug 'w0rp/ale'
" call dein#add('neomake/neomake')

" call vivid#enable()

""" Dein Config End
call plug#end()

""" Plugins Config

" Tagbar config

nmap <F5> :TagbarToggle<cr>


" Config Tags
" let g:gutentags_cache_dir="/home/strixx/hdd/"

" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ }

" nnoremap <silent> gd :call LanguageClient_textDocument_hover()<CR>

let base16colorspace=256


"" Deoplete
" Enable
let g:deoplete#enable_at_startup = 1

" Enable syntax plugins
let python_highlight_all = 1

" Echodoc Config
call echodoc#enable()

"" Completor Plugin Config
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Jedi Path
" let g:completor_python_binary = '/home/strixx/.local/lib/python3.6/site-packages'

" BufTabline Config
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Matchup Config
let g:matchup_matchparen_status_offscreen = 1
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_stopline = 200
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 60
let g:matchup_motion_enabled = 0

" Undotree Config
nmap <leader>u :UndotreeToggle<cr>

""" Code Linters

" "" Neomake Config
" let g:neomake_place_signs = 0
" let g:neomake_highlight_columns = 0
" let g:neomake_open_list = 2
" let g:neomake_echo_current_error = 0

""" Ale Config
" let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1

" Enable completion
let g:ale_completion_enabled = 1

" Set linter delay in ms
let g:ale_lint_delay = 500

" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 1

" Choose linters you want to run for that specific FileType
let g:ale_linters = {
	    \   'html': ['tidy'],
	    \}

let g:ale_fixers = {
	    \   'python': ['autopep8'],
	    \}

let g:ale_set_signs=1
let g:ale_open_list=0
let g:ale_set_highlights=0

" Sneak Plugin Config
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
let g:sneak#s_next = 1
let g:sneak#target_labels = "123456789qwertasdfg"
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1

nmap <silent> s :<C-U>call sneak#wrap('',           2, 0, 2, 1)<CR>
nmap <silent> S :<C-U>call sneak#wrap('',           2, 1, 2, 1)<CR>


" Configure dirvish Plugin

let g:dirvish_mode =':sort ,^.*[\/],'
let g:drivish_relative_paths = 1

nmap _ :Dirvish<cr>
function! DirvishMapping()
    nmap <buffer> l <cr>
    nmap <buffer> h -
endfunction

""" Fancy statusbar

" "" Airline

" let g:airline_extension= []
" let g:airline_highlight_cache = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline_theme='minimalist'
" let g:airline_inactive_cikkaose=1


" " Lightline Plugin Config
let g:lightline = {
	    \ 'colorscheme': 'wombat',
	    \ 'active': {
	    \   'left': [ ['mode', 'paste'],
	    \             ['fugitive', 'readonly', 'absolutepath','bufnum', 'modified'] ],
	    \   'right': [ [ 'lineinfo' ], ['percent'], ['servername'] ]
	    \ },
	    \ 'component': {
	    \   'readonly': '%{&filetype=="help"?"":&readonly?"??":""}',
	    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
	    \   'ftString': "ft=",
	    \ 'mode': '%{lightline#mode()}',
	    \ 'paste': '%{&paste?"PASTE":""}',
	    \ 'percent': '%3p%%',
	    \ 'lineinfo': '%3l:%-2v',
	    \ 'servername': v:servername,
	    \ },
	    \ 'component_visible_condition': {
	    \   'readonly': '(&filetype!="help"&& &readonly)',
	    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
	    \   'mode': '&ft!="netrw"',
	    \   'lineinfo': '&ft=="netrw"',
	    \   'percent': '&ft=="netrw"',
	    \ },
	    \ 'separator': { 'left': ' ', 'right': ' ' },
	    \ 'subseparator': { 'left': ' ', 'right': ' ' },
	    \ }
" let g:lightline.component = {'filetype': 'FileType: %{&ft!=#""?&ft:"Null"}'}

" UndoTree Plugin
let g:undotree_DiffAutoOpen = 0

" UndoTree Custom Mappings
function! g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeGoNextState
    nmap <buffer> K <plug>UndotreeGoPreviousState
    nmap <buffer> o <plug>UndotreeEnter
endfunc

" Winresizer Plugin Config
let g:winresizer_start_key =  '<C-W>r'
if has ("unix")
    " FzF Plugin Config
    let g:fzf_layout = { 'down': '~30%' }
endif

" " Set Camelmotion default mappings
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie

" let g:wordmotion_spaces = '#'

""" Plugins Config End

""" Vim Config

" Add macro on visual
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Set Fontsize
if has ("win32")
    set guifont=Monaco:h10:cDEFAULT
endif

" Add Ctrl+w+hjkl to switch window
nnoremap <left> <c-w>h
nnoremap <down> <c-w>j
nnoremap <up> <c-w>k
nnoremap <right> <c-w>l

" Grap the current word and seach it on buffers

noremap <leader># :Grepper -tool rg -cword -buffers -noprompt<cr>

" Map ctrl hjkl to buffer navigation, toggle readonly and delete buffer
nnoremap <c-h> :bp<cr> :echo 'Buffer Previous'<cr>
nnoremap <C-j> :bd!<cr> :echo 'Buffer Deleted'<cr>
nnoremap <C-k> :set ro!<cr> :echo 'Set Readonly Toggle'<cr>
nnoremap <C-l> :bn<cr> :echo 'Buffer Next'<cr>

" Access Buffers Faster With Numbers
nnoremap <F2> :buffers<CR>:buffer<space>

" Map Shift-k to (split) a paragraph to complete shift j (join), also make J behave like gJ
nnoremap K i<cr><Esc>
nnoremap J gJ

" Map jj for fast exit
imap jj <Esc>



" Disable netrw
" let loaded_netrwPlugin = 0

" Vim Color Settings
" set termguicolors
syntax on
colorscheme base16-flat

" Syntax fix
" set syntax synmaxcol=256

" GUI Vim , Make it look like terminal

if has ("gui")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

" Tabs
set softtabstop=0
set noexpandtab
set shiftwidth=4

" Undo History Fixes
set undofile
if has ("nvim") && has ('unix')
    set undodir=~/.config/nvim/undoHistory/
else
    set undodir=~/.vim/undoHISTORY
endif
set ul=1000

" Move Line up and down mapping
noremap <silent> <c-down> :m '>+1<cr>gv=gv
noremap <silent> <c-up> :m '<-2<cr>gv=gv

" Better Search
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Fix for GUI ColorScheme
if !has('gui_running')
    set t_Co=256
endif

" Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" Set Working Directory to folder , like gf but for folders
nnoremap gF :cd <c-r><c-f><cr>

" Reload vim's config without having to exit vim
if has ("nvim")
    map <leader>r :source ~/.config/nvim/init.vim<cr>
else
    map <leader>r :source ~/_vimrc<cr>
endif

" Abbreviations
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
cnoreabbrev ss SessionSave
cnoreabbrev sc SessionClose
cnoreabbrev syn call ToggleSyntax()<cr>:echom "Toggling Global Syntax"<cr>
cnoreabbrev synL call ToggleSyntaxLocal()<cr>:echom "Toggling Local Syntax"<cr>
cnoreabbrev notes Notes

""" Vim Config End

""" Functions Config

" Check if has session open

" function! SessionCheck()
"     if v:this_session!=""
" 	if confirm('Save to session to ' . v:this_session . '?', "&Yes\n&No", 1)==1
" 	    SessionSave
" 	    quit
" 	else
" 	    quit
" 	endif
"     else
" 	quit
"     endif
" endfunction

let sessionman_save_on_exit = 0


" Contrast Options
let g:contrastLevels = ['low', 'medium', 'high']
let g:cc = g:contrastLevels[0]
let g:contrastVar = 0
function! ToggleContrast()
    let g:cc = g:contrastLevels[g:contrastVar]
    let g:contrastVar = (g:contrastVar + 1) % len(g:contrastLevels)
    let g:colorNumber = 0
    if g:cc == "high"
	let g:mylist = ["base16-material", "base16-flat", "base16-dracula"]
    elseif g:cc == "medium"
	let g:mylist = ["base16-harmonic16-dark","base16-materia",]
    elseif g:cc == "low"
	let g:mylist = ["base16-ocean"]
    endif
endfunction

call ToggleContrast()

"" Color Switcher

" Set Variables
let g:contrast = g:contrastLevels[0]
let g:colorNumber = 0

function! ColorSchemeToggle()
    if exists("g:colorNumber")
	execute 'colorscheme ' . g:mylist[g:colorNumber]
	let g:colorNumber = (g:colorNumber + 1) % len(g:mylist)
    endif
endfunction

function! TermColor()
    " Use sed to delete lines on terminal color scheme
    silent !sed '/colors/,$d' ~/.config/termite/config > ~/.config/termite/config.bak && mv ~/.config/termite/config.bak ~/.config/termite/config
    " Using cat to add colors that vim uses
    silent execute '!cat ~/.config/termite/themes/'.g:colors_name.'.config >> ~/.config/termite/config'
    " Reload terminal config to use the new theme color
    silent !killall -USR1 termite
endfunction

nnoremap <F8> :call ColorSchemeToggle()<cr>:call TermColor()<cr>:execute "colo"<cr>
nnoremap <F20> :call ToggleContrast()<cr>:execute 'colorscheme ' . g:mylist[g:colorNumber]<cr>:call TermColor()<cr>:execute "echom g:cc"<cr>

command! ThemeSwitch :call ColorSchemeToggle()

function! DefaultColors()
    "Sneak Plugins Colors
    hi Sneak guifg=red guibg=NONE ctermfg=red ctermbg=NONE
    hi SneakScope guifg=red guibg=NONE ctermfg=red ctermbg=NONE
    hi SneakLabel guifg=red guibg=NONE ctermfg=red ctermbg=NONE
    hi VertSplit cterm=None guibg=None
    hi foldcolumn guibg=bg ctermbg=bg
    hi LineNr guibg=bg ctermbg=bg
    hi BufTabLineHidden ctermfg=1
    hi BufTabLineCurrent ctermfg=2
endfunction

" Buffer
function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

function! ReturnColorScheme()
    return g:colors_name
endfunction

" Call Macro On Visual
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Toggle Syntax Function
let g:syntaxLocalON = 1
function! ToggleSyntaxLocal()
    if g:syntaxLocalON == 0
	set syntax=on
	let g:syntaxLocalON = 1
    else
	set syntax=off
	let g:syntaxLocalON = 0
    endif
endfunction

let g:syntaxON = 1
function! ToggleSyntax()
    if g:syntaxON == 0
	syntax on
	let g:syntaxON = 1
    else
	syntax off
	let g:syntaxON = 0
    endif
endfunction

function! s:LoadSession(session)
    if v:this_session!=""
	if confirm('Save to session to ' . v:this_session . '?', "&Yes\n&No", 1)==1
	    SessionSave
	endif
    endif
    %bd
    exec "source " a:session
endfunction

""" Functions Config End

""" Autocmd Configs

augroup netrw_mappings
    au!
    au filetype dirvish call DirvishMapping()
augroup END
augroup Colorscheme
    au!
    autocmd ColorScheme * call DefaultColors()
augroup END

augroup Type
    au!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType python setlocal completeopt-=preview
augroup END

augroup EnterVim
    au!
    autocmd VimEnter * call DefaultColors()
    autocmd VimEnter * let g:grepper.tools = ['rg', 'ack', 'grep', 'findstr', 'ag', 'pt', 'sift', 'git']
augroup END

" augroup LeavingVim
"     au!
"     autocmd VimLeave * call SessionCheck()
" augroup END

""" Autocmd End

""" Speed Config

" Toggle Numbers
nnoremap <F3> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

" Disable Ruby
let g:loaded_ruby_provider = 1

"" Fix Python settings

" Path to python 3
if has ('win32')
    let g:python3_host_prog = 'C:\Program Files (x86)\Python36-32\python'
elseif has ('unix')
    let g:python3_host_prog = '/usr/bin/python'
endif


""" Speed Config End

""" Custom Commands

let g:cmdMenu = ['UndotreeToggle', "asdasd"]


if has ('unix')

    command! ShowCommand call fzf#run(fzf#wrap({'source': g:cmdMenu, 'sink': '', 'options': '-m +s'}))
    command! -range=% Share exe <line1>. ','.<line2>.'w !vpaste ft='.&ft
    command! FindAll call fzf#run(fzf#wrap({'source': 'cat ~/.vifm/fzf-read/locate-file', 'sink': 'e'}))
    command! FindSession call fzf#run(fzf#wrap({'source': 'cd ~/.config/nvim/session && readlink -f *', 'sink': function('s:LoadSession'), 'options': '-m +s'}))
    command! ProjectFind call fzf#run(fzf#wrap({'source': 'find . -type f', 'sink': 'e'}))
    command! FindHome call fzf#run(fzf#wrap({'source': 'find /home/strixx/ -type f  ! \( -path "*cache*" -o -path "*fonts*" -o -path "*icons*" -o -path "*help*" -o -path "*log*" -o -path "afs" -o -path "var*" -o -path "lib*" -o -path "tmp*" -o -path "proc*" -o -path "*deps*" -o -path "*node*" -o -path "*/src/*" -o -path "*gem*" -o -path "*/ruby/*" \) 2>&1 | grep -v "Permission denied"', 'sink': 'e'}))
    command! FZFProject call fzf#run(fzf#wrap({'source': 'cat ~/.config/nvim/Project-Path ', 'sink': 'cd'}))
    command! FZFBookmark call fzf#run(fzf#wrap({'source': "cat ~/.config/nvim/bookmarks | cut -d ' ' -f 1", 'sink': 'e'}))
    command! Mru call fzf#run({
		\  'source':  v:oldfiles,
		\  'sink':    'e',
		\  'options': '-m -x +s',
		\  'down':    '40%'})

    " FZF Mappings
    nnoremap <leader>fp :ProjectFind<cr>
    nnoremap <leader>fa :FindAll<cr>
    nnoremap <leader>fh :FindHome<cr>
    nnoremap <leader>fs :FindSession<cr>
    nnoremap <leader>fr :rviminfo!<cr>:Mru<cr>
    nnoremap <leader>fb :FZFBookmark<cr>
    nnoremap <leader>p  :FZFProject<cr>
    nnoremap <leader>B :!echo %:~ >> ~/.config/nvim/bookmarks<cr>
    nnoremap <leader>P :!pwd >> ~/.config/nvim/Project-Path<cr>
    nnoremap <silent> <Leader>b :call fzf#run({
		\   'source':  reverse(<sid>buflist()),
		\   'sink':    function('<sid>bufopen'),
		\   'options': '+m',
		\   'down':    len(<sid>buflist()) + 2
		\ })<CR>
    command! Notes :10new ~/Documents/notes
endif

" Mappings

cnoreabbrev ccd Ccd


""" Custom Commands End

""" Gui Special Configs


""" Gui Configs End
""" Call Functions one time
silent !touch /tmp/vim_running


" Setting up cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

