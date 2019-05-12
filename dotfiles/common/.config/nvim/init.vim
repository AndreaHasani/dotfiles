" Map Leader <Has to be first line>
let mapleader = " "
let g:mapleader = " "
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

set nocompatible

" Sane Defaults
filetype on
filetype plugin on
filetype indent on
set splitbelow
set splitright
set autoindent
" set title

" set timeoutlen=200
set timeoutlen=200
set hidden
set history=5000
set noswapfile
set wrap
set sidescroll=1
set gdefault
set viewdir=~/.vim/view/
set viewoptions=cursor,folds,slash,unix
set cursorline
set number
set foldmethod=manual
set linebreak
set ignorecase
set noshowmode
" set nu
set rnu
set clipboard=unnamedplus
let @/ = ""

""" Vivid Config

call plug#begin('~/.config/nvim/plugins')

" Window Split Plugins
Plug 'simeji/winresizer'
Plug 'wellle/visual-split.vim'

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
Plug 'bounceme/remote-viewer'
Plug 'mbbill/undotree'
Plug 'ferranpm/vim-isolate'
Plug 'brooth/far.vim'

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
" Plug 'Shougo/denite.nvim'
Plug 'aserebryakov/vim-todo-lists'
" Plug 'mattn/emmet-vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/vim-closer'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
" Plug 'maralla/completor.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'Shougo/neco-syntax'
Plug 'metakirby5/codi.vim'
Plug 'sheerun/vim-polyglot'

" Plug 'ervandew/supertab'

"Completion Plugins
" Plug 'wokalski/autocomplete-flow'


" Automaticly Features Plugin
Plug 'jamessan/vim-gnupg'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" Plug 'tmhedberg/SimpylFold'
" Plug 'b4b4r07/vim-sunset'
Plug 'pgdouyon/vim-evanesco'

" Benchmark Plugin
Plug 'tweekmonster/startuptime.vim'

" Tags
Plug 'majutsushi/tagbar'
Plug 'jsfaint/gen_tags.vim'

" Commands Plugin
if has ('unix')
    Plug 'mhinz/vim-grepper'
endif

Plug 'thinca/vim-quickrun'
Plug 'sbdchd/neoformat'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'andrewradev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'liuchengxu/vim-which-key'

" Intergrations Plugin
Plug 'tpope/vim-commentary'
" Plug 'mileszs/ack.vim'
Plug 'keith/gist.vim'
Plug 'szw/vim-maximizer'
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

" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'kh3phr3n/python-syntax'
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'



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
" Plug 'w0rp/ale'
" call dein#add('neomake/neomake')

" call vivid#enable()

""" Dein Config End
call plug#end()

""" Plugins Config



" Tagbar config
nmap <leader>wt :TagbarToggle<cr>


" Session
set sessionoptions-=options
let g:session_directory = '/home/strixx/.config/nvim/session/files'
let g:session_lock_directory = '/home/strixx/.config/nvim/session/locks'
let g:session_autosave_periodic = 15
let g:session_persist_colors = 0
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Config Tags
let g:gutentags_cache_dir="/home/strixx/.ctags_cache/"

" let g:LanguageClient_serverCommands = {
"     \ 'python': ['pyls'],
"     \ }

" nnoremap <silent> gd :call LanguageClient_textDocument_hover()<CR>

let base16colorspace=256

" Maximizer Toggle config
nnoremap <C-W>o <Nop>
nnoremap <C-W>f :MaximizerToggle<cr>

" Visual Split mappings

xmap <C-W>r  <Plug>(Visual-Split-VSResize)
xmap <C-W>s <Plug>(Visual-Split-VSSplit)
xmap <C-W>sa <Plug>(Visual-Split-VSSplitAbove)
xmap <C-W>sb <Plug>(Visual-Split-VSSplitBelow)

"" Deoplete
" Enable
let g:deoplete#enable_at_startup = 1

" Enable syntax plugins
let python_highlight_all = 1

" Echodoc Config
call echodoc#enable()

" Quickrun config

let g:quickrun_config = {'outputter/buffer/split': ':10' }

" Jedi Path
" let g:completor_python_binary = '/home/strixx/.local/lib/python3.6/site-packages'

" BufTabline Config
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Matchup Config
let g:matchup_matchparen_status_offscreen = 1
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_stopline = 400
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 60
let g:matchup_motion_enabled = 0


" Simple Fold Config

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0

" Undotree Config
nnoremap <leader>wu :UndotreeToggle<cr>

""" Code Linters

" "" Neomake Config
" let g:neomake_place_signs = 0
" let g:neomake_highlight_columns = 0
" let g:neomake_open_list = 2
" let g:neomake_echo_current_error = 0

""" Coc Config
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes



""" Ale Config

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
    nmap <buffer> c :cd %<cr> :echo "Changing"
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
	    \ 'component_function': {
	    \   'cocstatus': 'coc#status',
	    \   'currentfunction': 'CocCurrentFunction'
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

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_iconchars = ['>', '-']

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

" Map ctrl hjkl to buffer navigation, toggle readonly and delete buffer
nnoremap <c-h> :bp<cr> :echo 'Buffer Previous'<cr>
nnoremap <C-j> :bd!<cr> :echo 'Buffer Deleted'<cr>
nnoremap <C-k> :set ro!<cr> :echo 'Set Readonly Toggle'<cr>
nnoremap <C-l> :bn<cr> :echo 'Buffer Next'<cr>

" Access Buffers Faster With Numbers
nnoremap <buffer> <F2> :exec '!python' shellescape(@%, 1)<cr>

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
cnoreabbrev ss SaveSession
cnoreabbrev sc CloseSession
cnoreabbrev so OpenSession
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
    hi BufTabLineHidden ctermfg=7
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

function! s:LoadSession(session)
    SaveSession
    CloseSession
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
    " autocmd FileType python setlocal completeopt-=preview
augroup END

augroup EnterVim
    au!
    autocmd VimEnter * call DefaultColors()
    autocmd VimEnter * let g:grepper.tools = ['rg', 'ack', 'grep', 'findstr', 'ag', 'pt', 'sift', 'git']
augroup END

 augroup vimrc
   autocmd!
   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
 augroup END


" augroup LeavingVim
"     au!
"     autocmd VimLeave * call SessionCheck()
" augroup END

""" Autocmd End

""" Speed Config

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

"""" YCM config

let g:ycm_add_preview_to_completeopt = 1
""" Goto Commands
map <silent> gd :call CocActionAsync('jumpDefinition')<cr>
map <silent> gD :call CocActionAsync('jumpDeclaration')<cr>
map <silent> gr :call CocActionAsync('jumpReferences')<cr>
map <silent> gh :call <SID>show_documentation()<CR>
map <silent> gi :call CocActionAsync('jumpImplementation')<cr>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

if has ('unix')

    command! ShowCommand call fzf#run(fzf#wrap({'source': g:cmdMenu, 'sink': '', 'options': '-m +s'}))
    command! -range=% Share exe <line1>. ','.<line2>.'w !vpaste ft='.&ft
    command! FindAll call fzf#run(fzf#wrap({'source': 'cat ~/.vifm/fzf-read/locate-file', 'sink': 'e'}))
    command! FindSession call fzf#run(fzf#wrap({'source': 'cd ~/.config/nvim/session/files && readlink -f *', 'sink': function('s:LoadSession'), 'options': '-m +s'}))
    command! ProjectFind call fzf#run(fzf#wrap({'source': 'find . -type f', 'sink': 'e'}))
    command! FindHome call fzf#run(fzf#wrap({'source': 'find /home/strixx/ -type f  ! \( -path "*cache*" -o -path "*fonts*" -o -path "*icons*" -o -path "*help*" -o -path "*log*" -o -path "afs" -o -path "var*" -o -path "lib*" -o -path "tmp*" -o -path "proc*" -o -path "*deps*" -o -path "*node*" -o -path "*/src/*" -o -path "*gem*" -o -path "*/ruby/*" \) 2>&1 | grep -v "Permission denied"', 'sink': 'e'}))
    command! FZFProject call fzf#run(fzf#wrap({'source': 'cat ~/.config/nvim/Project-Path ', 'sink': 'cd'}))
    command! FZFBuffers call fzf#run({'source':  reverse(<sid>buflist()),'sink':    function('<sid>bufopen'), 'options': '+m',  'down':    len(<sid>buflist()) + 2 })

    command! FZFBookmark call fzf#run(fzf#wrap({'source': "cat ~/.config/nvim/bookmarks | cut -d ' ' -f 1", 'sink': 'e'}))
    command! Mru call fzf#run({
		\  'source':  v:oldfiles,
		\  'sink':    'e',
		\  'options': '-m -x +s',
		\  'down':    '40%'})

    " FZF Mappings, find mappings
    nnoremap <leader>fp :ProjectFind<cr>
    nnoremap <leader>fa :FindAll<cr>
    nnoremap <leader>fh :FindHome<cr>
    nnoremap <leader>fs :FindSession<cr>
    nnoremap <leader>fr :rviminfo!<cr>:Mru<cr>
    nnoremap <leader>fb :FZFBookmark<cr>
    nnoremap <leader>p  :FZFProject<cr>
    nnoremap <leader>B :!echo %:~ >> ~/.config/nvim/bookmarks<cr>
    nnoremap <leader>P :!pwd >> ~/.config/nvim/Project-Path<cr>
    nnoremap <silent> <Leader>b :FZFBuffers<cr>


    " Find mappings
    noremap <leader>fgc :Grepper -tool rg -cword -noprompt<cr>
    noremap <leader>fg :Grepper -tool rg <cr>
    command! Notes :10new ~/Documents/notes
endif

" Mappings

cnoreabbrev ccd Ccd
cnoreabbrev fix ALEFix



""" Custom Commands End

"" Mappings Order
let g:sprunge_map = '<Leader>ss'


" Which Key config for desc
let g:which_key_timeout = 10
let g:which_key_map =  {
	    \ 'name' : 'Leader Key',
	    \ '#' : 'Search cursor on buffers with grep',
	    \}

let g:which_key_map.t = {
	    \ 'name' : 'Cursor GoTo' ,
	    \}

let g:which_key_map.f = {
	    \ 'name' : 'Find' ,
	    \ 'g' : 'Grep' ,
	    \}


let g:which_key_map.w = {
	    \ 'name' : 'Window Menu' ,
	    \}

let g:which_key_map.s = {
	    \ 'name' : 'Share' ,
	    \ 's' : 'Share to sprunge' ,
	    \}

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

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
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

