au BufNewFile,BufRead *.smt2 set filetype=smt2
au BufNewFile,BufRead *.dl set filetype=datalog
au BufNewFile,BufRead *.ml let g:eval_command="ocaml -stdin"
au BufNewFile,BufRead *.py let g:eval_command="python - || python2.7 -"

if !exists("g:eval_command")
    let g:eval_command = "z3 -smt2 -in"
endif

function! Eval()
    let stdin = join(getline(0, '$'), "\n")
    let res = system(g:eval_command, stdin)

    tabnew
    normal! ggdG
    setlocal filetype=smt2
    setlocal buftype=nofile
    call append(0, split(res, '\v\n'))
endfunction

command Eval :call Eval()
nmap , :Eval<CR>
