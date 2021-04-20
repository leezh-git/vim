" 不以兼容模式运行
set nocompatible
" 显示行号
set nu
" set relativenumber
" 缩进
set cindent
" 自动缩排（下排跟随上排缩进）
" set autoindent
" 输入闭括号时，高亮开括号
set showmatch
" 左右滚动 和 达到右边界时滚动的字符数
" set nowrap
" set sidescroll=10
" 光标行显示一条线
set cursorline
" 右下角显示命令
set showcmd
" 补全时显示相关命令
set wildmenu
" 光标移动时会保留5行
set scrolloff=5
" 边输入边搜索
set incsearch
" 高亮搜索结果
set hlsearch
" 智能搜索/忽略大小写搜索
" set smartcase
" set ignorecast
" 不现实左下角的“插入”提示
" set noshowmode
" 高亮
syntax on

" 颜色主题
" colorscheme zellner
colorscheme torte
" colorscheme desert
" colorscheme elflord
" colorscheme industry
" colorscheme ron
" colorscheme slate

" Ctrl+q > 不保存退出
" Shift+w > 保存
" Shift+q > 退出退出
" Ctrl+l/h > 激活右/左边窗口
" Ctrl+f > 替换
" Ctrl+y/p > 复制/粘贴系统剪贴板
" HJKL可以较大幅度移动
" '' > 快速返回刚才的位置
" Ctrl+n > 关闭搜索高亮
" 0 > 行开头
" - > 行结尾
map  :q!
map W :w
map Q :q
map  l
map  h
map  :%s//gcODODOD
noremap  "+y
noremap  "+p
noremap J 5j
noremap K 5k
noremap H 8h
noremap L 8l
noremap '' ``
map  :nohlsearch
noremap 0 ^
noremap - $
noremap U 

" Ctrl+r > 重新加载配置文件
map  :source $MYVIMRC

" markdown的快捷操作（插入模式）
" ,b > 加粗
" ,i > 倾斜
" ,, > 结束
map! ,b ****<leezh>8hi
map! ,i **<leezh>7hi
map! ,, /<leezh>:nohlsearch7cl



" 检测vim-plug有没有安装
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" vim-plug
call plug#begin('~/.vim/plugged')
" Plug 'theniceboy/vim-deus'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline'
" Plug 'junegunn/seoul256.vim'
Plug 'leezh-git/seoul256.vim'
" Plug 'connorholyday/vim-snazzy'
call plug#end()

" theniceboy/vim-deus
" color deus

" junegunn/seoul256.vim
color seoul256
set background=dark


" iamcco/markdown-preview.nvim
let g:mkdp_browser = 'chromium'
map R :MarkdownPreview
