execute pathogen#infect()
filetype plugin indent on
if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg":s:white })
end

syntax on
colorscheme onedark

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set pastetoggle=<F3>

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

map <Tab> <C-w>w
map <Bar> :vsplit<CR>

" Set the tab width
let s:tabwidth=8
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
:%retab!
