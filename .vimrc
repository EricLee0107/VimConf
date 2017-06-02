inoremap jj <esc>

let g:vimconf_vundle_conf='~/.vim/bundle/VimConf/vundle.vim'
let g:vimconf_path='~/.vim/bundle/VimConf'

" 设置vim中文显示的支持
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"
set helplang=cn
"
" 关闭vim对vi的兼容
set nocompatible
filetype off
execute 'so'.g:vimconf_vundle_conf  
"
"
"开启文件类型检测
filetype on
filetype plugin on		        " 针对不同的文件类型加载对应的插件
filetype plugin indent on		    " 启动自动补全
au InsertLeave *.* write         " 每次退出插入模式时自动保存
"
""""""""""""""""
" Editor
""""""""""""""""
" 设置语法高亮
syntax on
"
" 文本格式设置
set number				" 显示行号
set cindent				" 自动缩进4空格
set smartindent			" 智能自动缩进
set autoindent			" 设置自动缩进
set shiftwidth=4		" 将换行自动缩进设置成4个空格
set autoread			" 文件在Vim之外修改过，自动重新读入
set autowriteall		" 提示保存
set ignorecase			" 搜索 小写正文时大小写不敏感
set smartcase				"
" 搜索正文包含大写时大小写敏感(当有大写字符时会覆盖掉ignorecase)
set incsearch				" 高亮搜素文本
set showmatch			" 插入括号时短暂跳转到匹配的括号
set ts=4				" 让一个tab等于4个空格
set expandtab
"

aug configPc
    :autocmd!
    autocmd BufNewFile,BufRead *.* :set fileformat=unix
    autocmd fileType python execute 'so '.g:vimconf_path.'/python.vim'
    autocmd BufNewFile,BufRead *.go execute 'so '.g:vimconf_path.'/golang.vim'
    autocmd fileType erlang execute 'so '.g:vimc:onf_path.'/erlang.vim'
aug End





" 窗口管理 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 折叠
"set foldmethod=indent
"au BufWinLeave * silent mkview  " 保存文件的折叠状态
"au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap<space> za		" 用空格来切换折叠状态
"
"""""""""""""""""""
" => CTRL-P
""""""""""""""""""""
" 设置搜索范围
"
" ‘c’-当前路径，'r'-当前路径和他的上级目录,'a'-早当前目录和上级目录都不存在时向更上层的目录搜索
" 0 或者‘’ 不设置
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" 设置忽视的文件类型
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" 不明白用法暂时注释掉
" let g:ctrlp_user_command = 'find %s -type f'
"
"
""""""""""""""""""""
" => NERDTREE
""""""""""""""""""""
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
"""""""""""""""""
" => TAGLIST
"""""""""""""""""
let mapleader=','
noremap <silent> <leader>tl :TlistToggle<cr>
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1           "
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1         "
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1        " 在右侧窗口中显示taglist窗口
let g:ycm_semantic_triggers =  {'go' : [':'],'erlang' : [':']}
"
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons



