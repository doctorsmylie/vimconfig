"Vim custom configuration"
"Matthew J. Smylie

"Load opt packages.
packadd YouCompleteMe

"Preferences
"Enable mouse
set mouse=a
"Display line numbers.
set number
"Enable syntax highlighting.
syntax enable
let t_Co=256
colorscheme sorbet
"Show hidden buffers.
set hidden
"auto-indent lines, do not break inside words.
set autoindent
set lbr 
set breakindent
"tab width
set shiftwidth=4
let &softtabstop=&shiftwidth
"Keep cursor closer to center.
set scrolloff=5
"Wildmenu
set wildmenu
set wildmode=list:full
"set wildoptions=pum
set wildcharm=<C-k>
set completeopt="menu,popup"
"Case-insensitive searches, unless capitalized.
set ignorecase
set smartcase

"Custom commands: general
"Remap leader key. Default is \
nnoremap <space> <nop>
let mapleader = ' '
let maplocalleader = '\'

"Swap default scrolling of real lines vs visual lines.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"Center cursor after scrolling page or jumping to line.
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap gg ggzz

"Clear highlighted search results.
nnoremap <localleader><localleader> :noh<return>

"Custom commands: tabs and windows and buffers.

"Tab control shortcuts.
nnoremap <leader><tab>n :tabnew<return>
nnoremap <C-Right> :tabnext<return>
nnoremap <leader><tab>] :tabnext<return>
nnoremap <C-Left> :tabprevious<return>
nnoremap <leader><tab>[ :tabprevious<return>
nnoremap <leader><tab>q :tabclose<cr>

"Buffer controls.
nnoremap <C-Down> :bn<return>
nnoremap <leader>bn :bn<return>
nnoremap <C-Up> :bp<return>
nnoremap <leader>bp :bp<return>
nnoremap <leader>bd :bd<cr>
"Open list of buffers and prompt to switch.
nnoremap gb :ls<CR>:b<Space>
"Wildmenu buffer list.
nnoremap <leader>bb :buffer <C-k>
nnoremap <leader>bv :bo<space>vert<space>sbuffer <C-k>

"Alternate shortcut for all window commands.
nmap <leader>w <C-w>
nnoremap <C-w>q <C-w>c

"(Save all changed buffers?) and close the program.
nnoremap <leader>qs :xa<cr>
nnoremap <leader>qq :qa<cr>
nnoremap <leader>qk :qa!<cr>

"Juggling files better.
set path=.,**
nnoremap <leader>ff :find *
nnoremap <leader>fv :bo<space>vert<space>sfind *
nnoremap <leader>fp :e<space>~/.vim/vimrc<cr>
nnoremap <leader>fs :w<cr>

"Copy and paste using system clipboard. Requires gvim.
nnoremap <localleader>y "+y
nnoremap <localleader>p "+p

"Custom commands: terminal
"Open a bash terminal below current tab.
nnoremap <leader>ot :bel<Space>term<Space>bash<return>
"Force quit terminal window process and enter term-normal mode.
tnoremap <esc><esc> <C-w><C-c>

"Custom functions and variables.

"Deletes all instances of trailing whitespace.
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

"Plugin settings and commands:

"Load YCM code completion plugin (inactive by default).
"nnoremap <localleader>cc :packadd<Space>YouCompleteMe<CR>
"Options for YCM.
let g:ycm_autoclose_preview_window_after_insertion = 1

"Options for NERDTree file browser plugin.
nnoremap <localleader>f :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <localleader>t :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

"Options for vim-airline status bar plugin
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1 "smarter tab line
let g:airline#extensions#tabline#tab_min_count=2 "smarter tab line
let g:airline#extensions#tabline#buffer_min_count=2 "smarter tab line
let g:airline#extensions#whitespace#enabled = 0 "disable default warning about trailing whitespace.
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#ycm#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>0 <Plug>AirlineSelectTab0
nnoremap <leader>[ <Plug>AirlineSelectPrevTab
nnoremap <leader>] <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰'
let g:airline_symbols.maxlinenr = ':'
let g:airline_symbols.colnr = '∥'

"let g:airline_section_b = '%l:%v'
"let g:airline_section_b = '%-0.10{getcwd()}'

"Change the preset colors.
"highlight comment ctermfg=6
"highlight Pmenu ctermfg=0 ctermbg=219
highlight VertSplit cterm=NONE
"highlight wildmenu cterm=bold ctermbg=14
"highlight statusline ctermfg=224

"Cursor shape.
let &t_SI = "\e[5 q" "insert mode.
let &t_SR = "\e[5 q" "replace mode.
let &t_EI = "\e[1 q" "normal mode.
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
