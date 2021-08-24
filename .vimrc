colorscheme gruvbox
set background=dark
set tabstop=4
set softtabstop=4
set autoindent
set incsearch
set hlsearch

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db
noremap! <C-h> <C-w>
noremap! <C-BS> <C-w>
set backspace=indent,eol,start
  "Set the number of spaces for indentation to 4"
  "set shiftwidth=4
  "
  set autoindent
  "Use the automatic indentation method of C/C++ language"
  "set cindent
  "
  ""Set the specific indentation method of C/C++ language (take my windows
  set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

  "Display line number"
  "set nu
  "
  ""Show Ruler"
  set ruler

  "Reverse search content"
  "set hlsearch
  "
  ""Any value can be deleted"
  set backspace=2

  "When the cursor encounters a parenthesis, square bracket, or brace, it
  "automatically highlights the corresponding parenthesis, square bracket, or
  "brace"
  "set showmatch
  "
  ""Automatic matching and completion of brackets"
  function! JumpOver(char)
    if getline(".")[col(".")-1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
  endfunction

  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap <expr> } JumpOver('}')
  inoremap <expr> ) JumpOver(')')
  inoremap <expr> ] JumpOver(']')
 
  inoremap <C-e> <C-o>A
  nnoremap <Tab> >>_
  nnoremap <S-Tab> <<_
  inoremap <S-Tab> <C-D>
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv
  imap <C-BS> <C-W>
  map <C-D> X<Esc>lbce	 

  set t_Co=256
  syntax on
  
  set incsearch
  set ignorecase
  set smartcase
  set showmatch


  set number
  set noerrorbells
  set vb t_vb=

  set comments=sl:/*,mb:\ *,elx:\ */

  " Enable omni completion.
  autocmd FileType python setlocal omnifunc=pyhtoncomplete#Complete
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
  endif
  
  " Install DoxygenToolKit from http://www.vim.org/scripts/script.php?script_id=987
  function! ScrollQuarter(move)
      let height=winheight(0)

      if a:move == 'up'
    	  let key="\<C-Y>"
      else
    	  let key="\<C-E>"
      endif

      execute 'normal! ' . height/4 . key
  endfunction

  nnoremap <silent> <C-D> :call ScrollQuarter('down')<CR>))))

  set tabstop=4
  set shiftwidth=4
  set expandtab
  set backspace=indent,eol,start
  set nocompatible
  set autoindent
  set enc=utf-8
  set fenc=utf-8
  set termencoding=utf-8
  set history=1000
  set laststatus=2

  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv
  inoremap <C-j> <Esc>:m .+1<CR>==
  inoremap <C-k> <Esc>:m .-2<CR>==
  nnoremap <leader>k :m .-2<CR>==
  nnoremap <leader>j :m .+1<CR>==

  if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
      \ if v:insertmode == 'i' | 
      \   silent execute '!echo -ne "\e[6 q"' | redraw! |
      \ elseif v:insertmode == 'r' |
      \   silent execute '!echo -ne "\e[4 q"' | redraw! |
      \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
  endif

    
  "folding and unfolding
  set foldmethod=syntax
  set foldnestmax=10
  set nofoldenable
  set foldlevel=0
  set foldlevel=99

  set diffopt+=iwhite
  set diffexpr=""

  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul
 " in normal mode F2 will save the file
 nmap <F2> :w<CR>
 " in insert mode F2 will exit insert, save, enters insert again
 imap <F2> <ESC>:w<CR>i
 " switch between header/source with F4
 map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
 " recreate tags file with F5
 map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
 " create doxygen comment
 map <F6> :Dox<CR>
 " build using makeprg with <F7>
 map <F7> :make<CR>
 " build using makeprg with <S-F7>
 map <S-F7> :make clean all<CR>
 " goto definition with F12
 map <F12> <C-]>
 " in diff mode we use the spell check keys for merging
 set tags+=~/.vim/tags/cpp
 set tags+=~/.vim/tags/gl
 set tags+=~/.vim/tags/sdl
 set tags+=~/.vim/tags/qt4

 let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

"plugin for folding in python

autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
