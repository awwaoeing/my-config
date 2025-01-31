"{{{常用配置
" 自动更新～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～～
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 设置Vim的编码方式
set encoding=utf-8

"{{{代码折叠
"nerdtree默认使用 zM 命令关闭所有折叠,使用 zR 命令打开所有折叠

" 设置折叠方法为标记折叠
set foldmethod=marker
" 设置折叠标记
set foldmarker={{{,}}}

" 定义自定义映射，将 fo 映射为 za,{fo打开关闭折叠}
nnoremap fo za

" 在 normal 模式下将 `FO`
" 映射为打开所有折叠的快捷键.{ff/FF 打开/关闭所有折叠}
nnoremap ff zR
nnoremap FF zM

"}}}

set guicursor=n-v-c:block

"下划线
set cursorline

"重新打开文件后光标处于上次打开位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

" 启用语法高亮
syntax on

"设置行号，鼠标
set nu
set mouse=a

"设置备份
"set backup 

" 设置缩进的宽度为4个空格
set tabstop=4
set shiftwidth=4

" 在行末自动添加新行
set autoread

" 设置自动缩进
set autoindent

" 自动补全
set completeopt=longest,menu
set wildmenu 

" 设置搜索时忽略大小写
set ignorecase

" 在插入模式下自动补全大写字母
set smartcase

" 启用搜索高亮
set hlsearch

" 设置状态栏
set laststatus=0

"}}}


"{{{键位修改
inoremap jk <Esc>

vnoremap nn <Esc>
vnoremap <S-h> 0
vnoremap <S-l> $

nnoremap H 0
nnoremap L $



set pastetoggle=<F10>

nnoremap <Space><Space> :wq<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
"窗口切换,适用于nerdtree
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap tt :UndotreeToggle<CR>

" 定义自定义映射，将 fo 映射为 za
nnoremap fo za
"}}}

"{{{插件管理
call plug#begin('~/.vim/pluggen')
Plug 'jupyter-vim/jupyter-vim'

Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 安装 Dracula 配色方案
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'sillybun/vim-repl'

Plug 'szymonmaszke/vimpyter'

Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""dracula配色方案
colorscheme dracula
"开启真色
set termguicolors
" 取消变量类型定义的高亮显示
hi clear Type
hi link Type Normal
" 启用括号匹配高亮
set showmatch
highlight Identifier ctermfg=2 guifg=#A6E22E
" 设置变量类型定义的颜色
highlight Type ctermfg=2 guifg=#7FFFD4
" 设置括号的颜色为红色
highlight MatchParen ctermfg=1 guifg=#FF0000


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""coc.nvim配置
""<C-n>向下拉动菜单
""<C-p>向上拉动菜单
""<Tab>补全
""<ESC>关闭菜单


let g:coc_global_extensions = ['coc-clangd' ,'coc-snippets']
" 使用 <Tab> 键接受当前补全建议并插入代码片段
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""nerdtree配置

let g:NERDTreeWinSize=30
"control + t 打开和关闭nerdtree
nnoremap <C-t> :NERDTreeToggle<CR> 
"显示隐藏文件
let NERDTreeShowHidden=1

let g:NERDTreeAllowEditCmd = 1 " 允许直接编辑
let g:NERDTreeAutoDeleteBuffer = 1 " 自动删除缓冲

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""undotree配置

nnoremap tt :UndotreeToggle<CR>
"""使历史记录保留到undodir中
if has("persistent_undo")
	let target_path = expand('~/Package/.undodir')
	let &undodir=target_path
	set undofile
endif

function! UndotreeSetModifiable()
	set modifiable
	return ""
endfunction

nnoremap <silent> <Plug>UndotreeNodeSelect :call UndotreeSetModifiable()<CR><Plug>UndotreeNodeSelect

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""jupyter-vim配置
"用\t快捷键发送可视模式下的代码块给jupyter console
vmap     <buffer> <silent> <localleader>w  <Plug>JupyterRunVisual 





"}}}





"在插入模式摁大写 F10 (F10摁fn+10) 进入粘贴模式,从系统剪切板粘贴内容到vim 编辑器下
set pastetoggle=<F10>




"让 vim 找到anaconda3和conda下的解释器

if has('python3')
	let g:python3_host_prog = '/opt/anaconda3/envs/myenv/bin/python3'
	let g:pythonthree_executable='/opt/anaconda3/envs/myenv/bin/python3'
endif


