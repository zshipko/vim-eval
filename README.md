# vim-eval

* The `Eval` function is bound to the `,` key in normal mode.
* Change the `g:eval_command` variable to determine what shell command to use.
* It is possible to change the shell command for a filetype
    - For example, `au Filetype ocaml let g:eval_command = "ocaml -stdin"`

