set filetype=go

"自动补全括号
"inoremap () ()
"inoremap ( ()<ESC>i
"inoremap [] []
"inoremap [ []<ESC>i
"inoremap {} {}
"inoremap { {<ESC>o}<ESC>O

""""""""""新建.go文件，自动插入文件头“”“”“”“”“”“”“”“”“”“”“”“”“
map <F4> :call TitleDet() <cr>'s
""定义函数AddTitle,自动插入文件头
func! AddTitle()
    if &filetype == 'go'
        call append(0,"/****************************************************************************")
        call append(1," * FileName          :".expand("%:t"))
        call append(2," * Mail              :592779130@qq.com")
        call append(3," * Created Time      : " .strftime("%Y-%m-%d"))
        call append(4," * Last modified     : " .strftime("%Y-%m-%d %H:%M"))
        call append(5," * Description       : ")
        call append(6," * ****************************************************************************/")
        echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
    endif
endfunc
"" 更新最近修改时间和文件名
function! UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/* FileName/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    normal 'k'
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function! TitleDet()
    let n=1
    " 默认添加
    while n<7
        let line = getline(n)
        if line =~ '\v^\s*\*\s*Last\s*modified'
            call UpdateTitle()
            return
        endif
        let n = n+1
    endwhile
    call AddTitle()
endfunction
