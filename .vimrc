"set runtimepath+=~/.vim_runtime

"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim

"try
"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'taglist.vim'
Plugin 'cscope.vim'
" " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'The-NERD-tree'
Plugin 'bufexplorer.zip'
Plugin 'AutoClose'
Plugin 'ucompleteme'
Plugin 'ctrlp.vim'
Plugin 'Cpp11-Syntax-Support'
""Plugin 'Syntastic'
au FileType python let b:delimitMate_nesting_quotes = ['"']
noremap zz :BufExplorer<CR>
nmap <F10> :NERDTreeToggle<cr>
let NERDTreeWinPos='right'
map <F8> :!ctags -R --fields=+lS <CR>
map fj g]
map ff <C-T>
" tabedit
nmap te :tabedit 
nmap tn :tabnew<CR>
noremap <TAB> :tabn<cr>
noremap <F2> :Tlist<CR>
"ctrlp"
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.lib,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_depth = 40
if executable('ag')
" Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
let Tlist_Ctags_Cmd="/opt/local/bin/ctags"
syntax on

" Set syntax highlighting for specific file types"
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery
au BufNewFile,BufRead *.cpp set syntax=cpp11

" Color scheme"
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

set fileencodings=utf-8,bg18030,gbk,big5
set showcmd
set ruler
set tabstop=4
set shiftwidth=4
set number
set numberwidth=5
set textwidth=80
set colorcolumn=+1
"set list listchars=tab:»·,trail:·
set expandtab
set shiftround
set matchpairs+=<:>
set hlsearch

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
""call ucompleteme#Setup()
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

"syntastic"
Bundle 'scrooloose/syntastic'
""let g:syntastic_enable_signs = 1
""let g:syntastic_error_symbol='>>'
""let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
""let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_cpp_checkers=['cppcheck']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
""let g:syntastic_always_populate_loc_list=1
""let g:syntastic_auto_loc_list=1
""let g:syntastic_loc_list_height=5
""let g:syntastic_cpp_remove_include_errors = 1
""let g:syntastic_c_remove_include_errors = 1
""let g:syntastic_cpp_check_header = 0
let g:ycm_show_diagnostics_ui = 0
Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
"
let g:ctrlp_extensions = ['funky']"
