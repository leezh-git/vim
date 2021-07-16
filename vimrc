" 设置leader键
let mapleader = " "

" 通用设置
colorscheme industry
set nu
set relativenumber
set showcmd
set wildmenu
set scrolloff=5
set laststatus=2
set history=200
"set cursorline
set showmatch
set mouse=a

" 保存和退出
map Q :q<CR>
map W :w<CR>

" 移动和映射
noremap H 8h
noremap J 5j
noremap K 5k
noremap L 5l
noremap z zz
noremap e ea
noremap 9 (
noremap 0 )
noremap - ^
noremap = $
noremap ' ;
noremap ; ,

" 复制、粘贴
noremap <leader>y "zy
noremap <leader>d "zd
noremap <leader>p "zp
noremap <leader>P "zP

" 搜索、替换
set incsearch
set hlsearch
map <c-n> :nohlsearch<CR>
map <c-f> :%s//gcODODOD


" 回到上次编辑的位置
autocmd BufRead * execute "normal! `\""


" 	多窗口编辑
" Ctrl+e 	打开新窗口
" Ctrl+h或l 	改变活动窗口
" Ctrl+>或< 	改变窗口大小
map <c-e> :vsplit<CR><c-w>l:e 
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w><
noremap <c-k> <c-w>>


"	分页编辑
" leader+a	打开新分页
" leader+c	关闭其他分页
" t或者T	切换分页
map <leader>a :tabnew<CR>:e 
map <leader>c :tabonly<CR>
map t :tabnext<CR>
map T :tabprevious<CR>


"	自动缩进
" 仅设置了python和c
function AutoIndent()
	if &filetype == "python"
		set smartindent
		set autoindent
		set expandtab
		set shiftwidth=4
		set softtabstop=4
		set nocindent
	elseif &filetype == "c"
		set cindent
		set shiftwidth=8
		set softtabstop=0
		set nosmartindent
		set noautoindent
		set noexpandtab
	else
		set smartindent
		set autoindent
		set shiftwidth=8
		set softtabstop=0
		set nocindent
		set noexpandtab
	endif
endfunction
autocmd BufRead,BufNewFile * call AutoIndent()


"	检测新文件的类型
augroup CheckFileType_g
autocmd CursorMovedI * call CheckFileType()
augroup END
function CheckFileType()
	if exists("b:count") == 0
		let b:count = 0
	endif
	let b:count += 1
	if &filetype == "" && b:count > 20 && b:count < 200
		filetype detect
	elseif b:count >= 200 || &filetype != ""
		autocmd! CheckFileType_g
	endif
endfunction
