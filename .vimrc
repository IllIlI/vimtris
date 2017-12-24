echo "                                                                             -☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-"
echo "                                                                 ..!. ';…;' .!.. - 好心做壞事 - Hǎoxīn zuò huàishì -"
echo "                                                                         -☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-"
echo "                                  yī йи 二 èr еор 三 sān сан 四 sì сы 五 wǔ ву 六 liù лиу 七 qī си 八 bā ба 九 jiǔ тсяу 十 shí шиы 百 bǎi бай 千 qiān сьен"
echo "                                                                             -☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-☲-"


" Meta Settings " 
" ---------------
" ---------------
" ---------------
filetype plugin indent on
colorscheme northerner
syntax enable
syntax on
" ---
set nocompatible
set wildmode "For completion 
set path+=** "allow recursive filepaths to be used for completion"
set wildignorecase "(optional) ignore case in commandline filename complication
set wildignore+=**/Library/**
set wildignore+=**/Downloads/**
set wildignore+=**/Documents/**
set wildignore+=**/Applications/**
set wildignore+=**/Gnidoк/**
set wildignore+=**/node_modules/**
set tagstack
set encoding=utf-8
set fileencoding=utf-8
set guifont=Monaco:h12
set laststatus=2
set scrolloff=4
set t_Co=256
set noruler
set autoindent
set noshowmode
set hidden
set number
set number relativenumber "Active window line numbers settings
set guioptions=
set backupdir^=~/.vim/backup//
set directory^=~/.vim/tmp//
set ssop-=options "Do not store global and local values in a session


" Global Mappings "
" -----------------
" -----------------
" -----------------
"let mapleader = ","
let g:active_relativenumber = 1 
imap ds <ESC>
":map <Tab> :bp!<CR>
:map <C-F5> :mks! ~/cb/sessions/
:map <S-F9> :colorscheme northerner<CR>:set bg=dark<CR>:set cursorcolumn!<CR>:AirlineTheme oceanicnext<CR>:IndentGuidesEnable<CR>:cd ~/cb/<CR>
:map <C-F3> :source ~/cb/sessions/
:map <S-F10> :source ~/.vimrc<CR>
:map <S-F11> :colorscheme pyte<CR>:AirlineToggleWhitespace<CR>:AirlineTheme oceanicnextlight<CR>:set noshowmode<CR>:IndentGuidesEnable<CR>:cd ~/cb/<CR>:set bg=light<CR>:set cursorcolumn<CR>:highlight CursorLineNr guifg=#839496<CR>:pwd<CR>
:map <S-F12> :e ~/.vimrc<CR>
":map <S-Tab> :bn!<CR>
inoremap { {<CR>}<Esc>O
nnoremap <Leader>] :w!<CR>
nnoremap <Leader>[ :q!<CR>
nnoremap <Leader>z :! date<CR>
nnoremap <Leader>p :w!<CR>:RunJS %<CR>
nnoremap <Leader>l :,s/^/\/\//
nnoremap <Leader>; :,s/^\/\//
nnoremap gb :ls<CR>:buffer<Space>
set list "Display tab space as /
set listchars=tab:// "Display tab space as /
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" ---
let g:indentLine_color_gui = '#A4E57E'
let g:actnum_exclude =
	\ [ 'unite', 'tagbar', 'startify', 'undotree', 'gundo', 'vimshell', 'w3m', 'nerdtree' ]


" General Scripts "
" -----------------
" -----------------
" -----------------
autocmd BufEnter * :syntax sync fromstart
:autocmd CmdwinEnter * nnoremap <buffer> <F5> <CR>q:
":autocmd CmdwinEnter * nnoremap <buffer> <F5> :let g:CmdWindowLineMark=line(".")<CR>
augroup remember_folds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END
" ---
":RunJS % Operation Setting
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
	let isfirst = 1
	let words = []
	for word in split(a:cmdline)
		if isfirst
			let isfirst = 0  " don't change first word (shell command)
		else
			if word[0] =~ '\v[%#<]'
				let word = expand(word)
			endif
			let word = shellescape(word, 1)
		endif
		call add(words, word)
	endfor
	let expanded_cmdline = join(words)
	botright new
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	call setline(1, 'You entered:  ' . a:cmdline)
	call setline(2, 'Expanded to:  ' . expanded_cmdline)
	call append(line('$'), substitute(getline(2), '.', '=', 'g'))
	silent execute '$read !'. expanded_cmdline
	1
endfunction
command! -complete=file -nargs=* RunJS call s:RunShellCommand('node '.<q-args>)


" Plugins Installed "
" ---------
" ---------
" ---------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Wasser
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline' "<C-F5>
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jceb/vim-orgmode'
" Colorschemas
Plugin 'therubymug/vim-pyte'
Plugin 'mhartington/oceanic-next'
Plugin 'daftwooly/vim-northerner' 
" Others
Plugin 'shougo/neoinclude.vim' "Unite-tag dependency
Plugin 'shougo/neoyank.vim'
Plugin 'shougo/tabpagebuffer.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/unite-outline' "<C-F1>
Plugin 'tsukkee/unite-tag'
Plugin 'tpope/vim-fugitive' "Tag-related git integration
Plugin 'neomake/neomake' "???
Plugin 'jakedouglas/exuberant-ctags'
" Syntax
Plugin 'valloric/youcompleteme'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'stanangeloff/php.vim'
Plugin 'mattn/emmet-vim' "Html
" ---
call vundle#end()


" Unite Settings "
" ----------------
" ----------------
" ----------------
let g:unIte_source_history_yank_enable = 1
nnoremap <Leader>y :Unite history/yank<cr>
:map <F2> zm:Unite -winheight=25 line:all<CR> i
:map <F3> zm:Unite -vertical -winwidth=17 directory<CR>
":map <C-F1> :Unite -no-quit -vertical -winwidth=30 outline<CR>
" Unite-tag Settings
if empty(&buftype)
	nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
endif
" Neoyank Settings
let g:neoyank#file = $HOME.'/cb/txt/yankring.txt'
let g:neoyank#limit=10000
"Prevent further yank logging
"let g:neoyank#disable_write=1 


" Airline Settings "
" ------------------
" ------------------
" ------------------
set guifont=Source\ Code\ Pro\ for\ Powerline "Make sure to escape the spaces in the name properly
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'
:map <C-F5> :AirlineTheme sol<CR>
"Remove the filetype part
let g:airline_section_a=''
let g:airline_section_b=''
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"Remove separators for empty sections
let g:airline_skip_empty_sections = 0
"The following are some unicode symbols for customizing the left/right
"Note You must define the dictionary first before setting values. Also, it's a
"good idea to check whether it exists as to avoid accidentally overwriting
"its contents. >
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" ---
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
"let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = ''
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_err = '%w{[%w(#%fw)]}'


" Syntastic Settings "
" --------------------
" --------------------
" --------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:indentLine_setColors = 0
"
&quot;syntastic&quot;                                                                                                             
let g:syntastic_java_checker = 'javac'
let g:syntastic_java_javac_classpath = &quot;~/*.jar\n./src&quot;


" PHP Settings "
" --------------
" --------------
" --------------
"Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
" ---
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


" ConoLine Settings "
" -------------------
" -------------------
" -------------------
"let g:conoline_auto_enable = 1
"let g:conoline_use_colorscheme_default_normal=1
"let g:conoline_use_colorscheme_default_insert=1
"let g:conoline_color_normal_dark = 'guibg=#181818'
"let g:conoline_color_normal_nr_dark = 'guibg=#181818'
"let g:conoline_color_insert_dark = 'guibg=#000000'
"let g:conoline_color_insert_nr_dark = 'guibg=#000000'

echo "\n"
echo "                                                                                      Guten Morgen."





