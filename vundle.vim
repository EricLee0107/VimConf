set runtimepath +=~/.vim/bundle/vundle/
call vundle#rc('~/.vim/bundle/')
"required! 
 Plugin 'gmarik/vundle'
 " My bundles here:
 "
 " original repos on GitHub
 " 全局搜索插件
 Plugin 'kien/ctrlp.vim'
 Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'}
 "项目树插件
 Plugin 'scrooloose/nerdtree'
 " 这个插件可以显示文件的git增删状态
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 " vim-go 插件
 Plugin 'fatih/vim-go'
 Plugin 'Shougo/neocomplete.vim'
 Plugin 'majutsushi/tagbar'
 Plugin 'Shougo/neosnippet.vim'
 Plugin 'Shougo/neosnippet-snippets'
 Plugin 'garyburd/go-explorer'
 " vim-erlang 插件
 Plugin 'vim-erlang/vim-erlang-runtime' 
 Plugin 'vim-erlang/vim-erlang-omnicomplete' 
 Plugin 'vim-erlang/vim-erlang-skeletons' 
 Plugin 'vim-erlang/vim-erlang-compiler' 
 Plugin 'vim-erlang/vim-erlang-tags' 
 Plugin 'vim-erlang/erlang-motions.vim' 
 Plugin 'vim-erlang/vim-erlang_tools' 
 Plugin 'vim-erlang/vim-dialyzer'
" Cyc 插件
 Plugin 'Amazer/NoteVim'

 Plugin 'taglist.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'Lokaltog/vim-easymotion'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plugin 'tpope/vim-rails.git'
 " vim-scripts repos
 Plugin 'L9'
 Plugin 'FuzzyFinder'
 " non-GitHub repos
 Plugin 'git://git.wincent.com/command-t.git'
 " Git repos on your local machine (i.e. when working on your own plugin)
 Plugin 'file:///Users/gmarik/path/to/plugin'
 call vundle#end()
