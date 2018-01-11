







""""""""""新建.go文件，自动插入文件头“”“”“”“”“”“”“”“”“”“”“”“”“
map <F4> :call TitleDet() <cr>'
""定义函数AddTitle,自动插入文件头
func AddTitle()
    if &filetype == 'erlang'
        call append(0,"%%%%=========================================================================")
        call append(1,"%%% FileName          : ".expand("%:t"))
        call append(2,"%%% Author            : EricLee0107")   
        call append(3,"%%% Created Time      : " .strftime("%Y-%m-%d"))
        call append(4,"%%% Last modified     : " .strftime("%Y-%m-%d %H:%M"))
        call append(5,"%%% @doc")
        call append(6,"%%% ")
        call append(7,"%%% @end")
        call append(8,"%%% Mail              : 592779130@qq.com")
        call append(9,"%%%%========================================================================")
   echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
    endif
    let fila = expand("%:t")
    if fila =~ '\v^gen_.*\.erl'
        call append(10,"-module(".expand("%:r").").")
        call append(11,"-behaviour(gen_server).")
        r ~/.vim/bundle/VimConf/erlang_template/gen_server.erl
    elseif fila =~ '\v^lib_.*\.erl'
        call append(10,"-module(".expand("%:r").").")
        call append(11,"-export([]).")
    endif
endfunc
"" 更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/%%% Last modified\s*:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/%%% FileName/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    normal 'k'
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function TitleDet()
    let n=1
    " 默认添加
    while n<7
        let line = getline(n)
        if line =~ '\v^\%\%\%\s*Last\s*modified'
            call UpdateTitle()
            return
        endif
        let n = n+1
    endwhile
    call AddTitle()
endfunction
