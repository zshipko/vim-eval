au BufNewFile,BufRead *.smt2 set filetype=smt2
au BufNewFile,BufRead *.ml let g:eval_command = "ocaml -stdin"

if !exists("g:eval_command")
    let g:eval_command = "echo No command set"
endif

function! Eval()
    let stdin = join(getline(0, '$'), "\n")
    let res = system(g:eval_command, stdin)

    tabnew
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(res, '\v\n'))
endfunction

command Eval :call Eval()
nmap , :Eval<CR>
