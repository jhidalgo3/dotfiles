nmap ht gT

set smartindent
set expandtab

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/Cellar/go/misc/vim
filetype plugin indent on
syntax on


" Go setup.
" set rtp+=/usr/local/Cellar/go/1.1.2/libexec/misc/vim
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal shiftwidth=4 tabstop=4 background=light
autocmd FileType go colorscheme Tomorrow-Night
autocmd FileType go setlocal noexpandtab
let g:go_disable_autoinstall = 1
let g:syntastic_go_checkers=['']

" Python setup.
autocmd FileType python setlocal shiftwidth=4 tabstop=4 background=light
autocmd FileType python colorscheme Tomorrow-Night
autocmd FileType python set nofoldenable
let g:pymode_lint = 0
let g:pymode_rope = 0

" Some default stuff.
set bs=indent,eol,start

set tabstop=2
set number

set autoindent shiftwidth=2

set colorcolumn=80

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  filetype plugin indent on

endif

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch

set guifont=Menlo:h14

au BufNewFile,BufRead *.mobile.erb let b:eruby_subtype = 'html'

call pathogen#infect()
call pathogen#runtime_append_all_bundles()

syntax enable
let g:solarized_contrast="normal"
let g:solarized_termtrans=1
set background=dark
colorscheme idleFingers

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Better support for NERDTree and Ctrl-P
let g:ctrlp_dont_split = 'NERD_tree_2'

" Stuff for running rspec in mvim.
let s:plugin_path = expand("<sfile>:p:h:h")

if !exists("g:rspec_command")
  let s:cmd = "rspec {spec}"
  " let s:cmd = "bundle exec rspec {spec}"

  " if has("gui_running") && has("gui_macvim")
  "   let g:rspec_command = "silent !" . "~/.vim/bin/run_in_os_x_terminal '" . s:cmd . "'"
  " else
  let g:rspec_command = "!echo " . s:cmd . " && " . s:cmd
  " endif
endif

function! RunAllSpecs()
  let a:cmd = "rspec spec"
  execute "!echo " . a:cmd . " && " . a:cmd
  " let l:spec = "zeus rake spec"
  " call SetLastSpecCommand(l:spec)
  " call RunSpecs(l:spec)
endfunction

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:spec = @%
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:spec = @% . ":" . line(".")
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunLastSpec()
  if exists("s:last_spec_command")
    call RunSpecs(s:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1 || match(expand("%"), ".feature$") != -1
endfunction

function! SetLastSpecCommand(spec)
  let s:last_spec_command = a:spec
endfunction

function! RunSpecs(spec)
  execute substitute(g:rspec_command, "{spec}", a:spec, "g")
endfunction

map <Leader>R :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>