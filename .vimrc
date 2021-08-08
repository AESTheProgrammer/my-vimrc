color desert
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
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
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
     
  inoremap ( ()<Esc>i  
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap < <><Esc>i
  inoremap <expr> } JumpOver('}')
  inoremap <expr> ) JumpOver(')')
  inoremap <expr> ] JumpOver(']')
  inoremap <expr> > JumpOver('>')
 
  "inoremap } <Esc>la
  "inoremap { {<CR>}<Esc>O
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


  set relativenumber
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
  let g:DoxygenToolkit_authorName="Hu Fu <askfuhu@gmail.com>"
  function! ScrollQuarter(move)
      let height=winheight(0)

	  if a:move == 'up'
		  let key="\<C-Y>"
	  else
		  let key="\<C-E>"
	  endif

	  execute 'normal! ' . height/4 . key
  endfunction

  "nnoremap <silent> <C-U> :call ScrollQuarter('up')<CR>
  nnoremap <silent> <C-D> :call ScrollQuarter('down')<CR>))))

  set tabstop=4
  set shiftwidth=4
  set expandtab
  set backspace=indent,eol,start
  set nocompatible
  set smartindent
  set autoindent
  set enc=utf-8
  set fenc=utf-8
  set termencoding=utf-8
  set history=1000
  set laststatus=2
  set mouse=a

  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv
  inoremap <C-j> <esc>:m .+1<CR>==
  inoremap <C-k> <esc>:m .-2<CR>==
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
