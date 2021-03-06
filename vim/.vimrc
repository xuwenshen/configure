" ------------------ others --------------------" 
" ------------------ some keys mapping ---------------------" 
imap zk <ESC>

" 窗口设置
" unmap <C-w>\
map <C-w>- <C-w>_   " 重映射最大化窗口快捷键，针对水平分割的情况
" map <C-w>\ <C-w>|

map <F10> <Esc>:tabnew<cr>  " 设置F10为打开新标签页
" map <C-[> <C-t>  " 重映射函数往回跳转快捷键


" ------------------ some setting --------------------" 
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8  " 兼容中文字体，防止中文乱码
set nocompatible  " 去掉vi一致性模式，避免以前版本的一些bug

set number
syntax on
set hls     "搜索时高亮显示被找到的文本
set is
set sw=4
set showcmd
set mouse=a
set confirm
set backspace=2   "可随时用退格键删除
set whichwrap=b,s,<,>,[,]  "默认情况下，在 VIM 中当光标移到一行最左边的时候，我们继续按左键，光标不能回到上一行的最右边。
set cursorline   " 高亮光标所在的行
set noundofile  " 文件就不会产生.un文件
set nobackup
set noswapfile  " 文件就不会产生.swp文件
set colorcolumn=101
set nowrap

" 代码折叠
set foldmethod=indent  " 折叠方式：manual, indent(用缩进表示折叠), syntax(用语法高亮来定义折叠), marker(用标志折叠)
set foldlevelstart=99  " 打开文件默认不折叠


" 设置空格与tab键
set smarttab  " 根据文件中其他地方的缩进空格个数来确定一个tab是多少个空格
set tabstop=4
set shiftwidth=4 " 每一级缩进是多少个空格
set expandtab  " 将tab扩展成空格。noexpandtab反之

" 设置修改多窗口大小的快捷键映射
"nnoremap r+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap r- :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap v+ :exe "vertical resize " . (winheight(0) * 3/2)<CR>
"nnoremap v- :exe "vertical resize " . (winheight(0) * 2/3)<CR>


" 设置系统粘贴板
"vmap "+y :w !pbcopy<CR><CR>
"nmap "+p :r !pbpaste<CR><CR>
"" ctrl-x for cut
"vmap <C-x> :!pbcopy<cr>
"" " ctrl-c for copy
"vmap <C-c> :w !pbcopy<cr><cr>
"" " ctrl-v for paste
"nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>


" 开启256色并设置光标为GUI模式
"if !has('gui_running')
  "set t_Co=256
  "if has('termguicolors')
    "set termguicolors
  "end
  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  "set timeoutlen=1000
  "set ttimeoutlen=0
"end


" ------------------ some configures of plugin --------------------" 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" ADD YOUR PLUGIN
Plugin 'scrooloose/nerdtree'                "file / directory tree
Plugin 'scrooloose/nerdcommenter'           " code commenter
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/cscope.vim'             " 函数跳转的插件
Plugin 'bling/vim-airline'                  " 状态条加强
" Plugin 'vim-airline/vim-airline-themes'     " airline 的颜色主题
Plugin 'majutsushi/tagbar'                  " 函数跳转的插件，可以在vim中显示函数目录
Plugin 'vim-scripts/SuperTab'               " 使tab键有更快捷的上下文提示功能，自动补全的功能
Plugin 'flazz/vim-colorschemes'             " 颜色主题库
Plugin 'Yggdroot/indentLine'                " 显示缩进指示线
" Plugin 'fholgado/minibufexpl.vim'           " 多文件之间的切换
call vundle#end()
filetype plugin indent on


" ##################### minibufexpl config #####################  


" ##################### indentLine config #####################  
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
"let g:indentLine_setConceal = 0
let g:indentLine_char = "|"
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff = 1


" ##################### colorschemes config #####################  
set background=dark
colorscheme PaperColor


" ##################### SuperTab config #####################  
" 设置不同vim模式下都可以用tab和shift tab进行缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
"imap <S-tab> <Esc><<i

let g:SuperTabRetainCompletionType=2   " 0 - 不记录上次的补全方式; 1 - 记住上次的补全方式,直到用其他的补全命令改变它; 2 - 记住上次的补全方式,直到按ESC退出插入模式为止


" ##################### tagbar config #####################  
nmap <F9> :TagbarToggle<cr>
let g:tagbar_width=40
" let g:tagbar_autofocus=1          " 打开tagbar时自动转到tagbar窗口
let g:tagbar_sort=0               " if 0: 函数名按照在文件中的顺序排列，if 0: 函数名按照字典序排序


" ##################### airline config #####################  
let g:airline#extensions#tabline#enabled = 1 " 显示tabline，相当于minibufexpl的功能。
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer 数字从1开始
let g:airline_theme='dark'  " 设置颜色主题
" let g:airline_section_c=''
" call airline#parts#define_accent('file', 'red')
" nmap <tab> :bn<CR>
" nmap <S-tab> :bp<CR>


" ##################### nerdtree config #####################  
nmap <F8> :NERDTreeToggle<cr>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " 最后的文件关闭时自动关闭目录树
let NERDTreeWinSize=20


" ##################### nerdcommenter config #####################  
let mapleader=","  "默认是 \ ,mapleader的意思就是要启用注释时的启动命令一样

let g:NERDSpaceDelims=1 " add whitespace when commenting

"Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


