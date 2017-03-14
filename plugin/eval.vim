au BufNewFile,BufRead *.smt2 set filetype=smt2
au Filetype python let g:eval_command = "python2.7 --"
au Filetype ruby let g:eval_command = "ruby18 --"
au Filetype ocaml let g:eval_command = "ocaml -stdin"

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
