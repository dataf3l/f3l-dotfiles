call pathogen#infect()

if has('syntax') && (&t_Co > 2)
	  syntax on
  endif

"enable colors
filetype plugin indent on

colorscheme default 
set guifont=Source\ Code\ Pro:h24
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"highligjht 80 chars limit
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces

highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace1 ctermbg=red guibg=red
highlight ExtraWhitespace2 ctermbg=red guibg=red
highlight ExtraWhitespace3 ctermbg=red guibg=red
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Show tabs 
match ExtraWhitespace1 /\t/

" spaces only lines.
match ExtraWhitespace2 /^\s\+$/

" Switch off :match highlighting.
" :match

"http://stackoverflow.com/questions/3540923/
"how-can-i-search-in-vim-using-regular-expressions-for-letters-both-ascii-and-n

" show alt+space (
match ExtraWhitespace3 /[\xa0]/


" http://stackoverflow.com/questions/2129723/using-shiftarrows-to-select-text-in-vim-macvim
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
" http://stackoverflow.com/questions/2391022/configure-macvims-text-selection-to-not-include-character-under-cursor
set selection=exclusive

"http://superuser.com/questions/382060/shortcut-to-switch-tabs-in-macvim
" Meta+1-0 jumps to tab 1-10, Shift+Meta+1-0 jumps to tab 11-20:
let s:windowmapnr = 0
let s:wins='1234567890!@#$%^&*()'
while (s:windowmapnr < strlen(s:wins))
    exe 'noremap <silent> <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
    exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
    exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    let s:windowmapnr += 1
endwhile
unlet s:windowmapnr s:wins



"map <D-Right> :tabne<esc>
"map <D-Left> :tabp<esc>

"change the tab damnit
map <C-Tab> :tabne<cr>
map <C-S-Tab> :tabp<cr>
imap <C-Tab> <esc>:tabne<cr>i
imap <C-S-Tab> <esc>:tabp<cr>i

" http://superuser.com/questions/417745/how-do-i-set-the-cursor-to-stop-when-it-hits-the-end-of-a-line-in-vim
"move to the next line damnit
set ww=<,>,[,]
map <D-e> :!open -n -a Terminal<cr>
imap <D-e> <esc>:!open -n -a Terminal<cr>i

"inoremap "      ""<Left>
"inoremap ""     "

" http://od-eon.com/blogs/calvin/polishing-vim/
set autochdir
set hlsearch
set nowrap
set splitright
set nu
set nobackup
set noswapfile



autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

set ruler

menu Git.Diff :Gdiff<cr>
menu Git.Status :Gstatus<cr>
menu Git.Blame :Gblame<cr>
menu Paren.Parens :RainbowParenthesesToggleAll<cr>
menu Indent.Indent IndentGuidesEnable
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" http://learnvimscriptthehardway.stevelosh.com/chapters/23.html

function! FindError()
	exe "normal /connect"
endfunction

function! MyFixOlac()
	exe "normal orequire_once($root_path.'include/inc_init_main.php');"
	exe "normal o#f3l 2014"
	exe "normal o#"
endfunction

function! FixOlac()
	exe "normal orequire_once($root_path.'include/inc_init_main.php');"
	exe "normal o#f3l 2014"
	exe "normal o#"
endfunction
function! AddIncludeOlac()
	:silent! s/"192.168.99.4"/$dbhost/
	:silent! s/"localhost"/$dbhost/
	:silent! s/"olac"/$dbname
	:silent! s/"root"/$dbusername
	:silent! s/"asdqwe123"/$dbpassword/

	:silent! s/'192.168.99.4'/$dbhost/
	:silent! s/'localhost'/$dbhost/
	:silent! s/'olac'/$dbname
	:silent! s/'root'/$dbusername
	:silent! s/'asdqwe123'/$dbpassword/

endfunction

function! AddIncludeRips()
	:silent! s/"192.168.99.4"/$ripsDB_host/
	:silent! s/"localhost"/$ripsDB_host/
	:silent! s/"rips"/$ripsDB_database
	:silent! s/"root"/$ripsDB_user
	:silent! s/"asdqwe123"/$ripsDB_password/

	:silent! s/'192.168.99.4'/$ripsDB_host/
	:silent! s/'localhost'/$ripsDB_host/
	:silent! s/'rips'/$ripsDB_database
	:silent! s/'root'/$ripsDB_user
	:silent! s/'asdqwe123'/$ripsDB_password/

endfunction


map <F4> :call FindError()<cr>
map <F5> :call AddIncludeOlac()<cr>
map <F6> :call FixOlac()<cr>
map <F7> :call AddIncludeRips()<cr>

imap <F4> <esc>:call FindError()<cr>i
imap <F5> <esc>:call AddIncludeOlac()<cr>i
imap <F6> <esc>:call FixOlac()<cr>i
imap <F7> <esc>:call AddIncludeRips()<cr>i


noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map <Space> h
imap <S-Space> <esc>i
map <S-Space> h


