au BufNewFile,BufRead *.smt2 set filetype=smt2
au Filetype python let g:eval_command = "python --"
au Filetype ruby let g:eval_command = "ruby --"
au Filetype ocaml let g:eval_command = "ocaml -stdin"
au Filetype smt2 let g:eval_command = "z3 -smt2 -in"

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
