" turn off coloured background
filetype plugin indent on
if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg":s:white })
end

" turn on colour scheme
syntax on
colorscheme onedark

" allow infinite undo's, delete files older than 90 days
set undofile
set undodir=~/.vim/undodir
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
call map(s:undos, 'delete(v:val)')


set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set pastetoggle=<F3>

" use NERDTree, set to right
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" map NERDCommenter
map cc <leader>c<space>

" search
set hlsearch
set incsearch
nnoremap \ :noh<return>

" remap the tab keys
map <Tab> <C-w>w
map <Bar> :vsplit<CR>

" allow delete in normal mode
nnoremap <bs> X
set backspace=2 " this is apparently needed for mac

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

set modeline " use modelines sometimes
" # vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

" breakpoints
map B oimport IPython; IPython.embed()<esc>

" Python linting
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_python_flake8_args="--ignore=E127,E126,E128"

map AA :ALEToggle<CR>

" get rid of trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" open lab book
function! NBopen(nbtarget)
	let t_nbyear=strpart(a:nbtarget, 0, 4)
	let t_nbmonth=strpart(a:nbtarget, 4, 2)
	let t_nbfile=a:nbtarget.".md"
	let target_path="~/Desktop/labbook/".t_nbyear."/".t_nbmonth."/".t_nbfile
	exec "edit ".target_path
endfunction
command! -nargs=1 NBopen call NBopen(<f-args>)

" get rid of swps
set backupdir=/tmp//
set directory=/tmp//

" markdown folding off
let g:vim_markdown_folding_disabled = 1

" change frontmatter color, setext headerstyle conflict
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

let g:goyo_width=100

function! s:goyo_enter()
  set wrap linebreak tw=100
  set formatoptions=ant
  set spell spelllang=en
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
