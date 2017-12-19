" import pathogen
execute pathogen#infect()  

" turn off coloured background
filetype plugin indent on
if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg":s:white })
end


" turn on colour scheme
syntax on
colorscheme onedark

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set pastetoggle=<F3>

" use NERDTree, set to right
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" remap the tab keys
map <Tab> <C-w>w
map <Bar> :vsplit<CR>

" allow delete in normal mode
nnoremap <bs> X

" turn on adding visual block
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" turn on the cursor position if not default
set ruler

" swap Q and W
command Q q
command W w

" Set the tab width
let s:tabwidth=8
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
:%retab!

" breakpoints
map B oimport pdb; pdb.set_trace()<esc>


" Python linting
let g:ale_linters = {'python': ['flake8']}
let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_python_flake8_args="--ignore=E127,E126,E128"

map AA :ALEToggle<CR>


" get rid of trailing whitespace
autocmd BufEnter *.py EnableStripWhitespaceOnSave
