" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Vim options (option)
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright

" Set Dein base path (required)
let s:dein_base = '/root/.local/share/dein'

" Set Dein source path (required)
let s:dein_src = '/root/.local/share/dein/repos/github.com/Shougo/dein.vim'

" Set Dein toml path (option)
let s:general_toml = '/root/.local/share/dein/toml/general.toml'
let s:dark_powered_toml = '/root/.local/share/dein/toml/dark_powered.toml'
let s:general_lazy_toml = '/root/.local/share/dein/toml/general_lazy.toml'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)
  call dein#add(s:dein_src)

  " Your plugins go here:
  call dein#load_toml(s:general_toml, {'lazy': 0})
  call dein#load_toml(s:dark_powered_toml, {'lazy': 0})
  call dein#load_toml(s:general_lazy_toml, {'lazy': 1})

  " Finish Dein initialization (required)
  call dein#end()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
