" Vim syntax file
" Language: SMT-LIB
" Maintainer: Roberto Vigo
" Latest Revision: 23 Jan 2012

if exists("b:current_syntax")
  finish
endif

let g:eval_command = "z3 -smt2 -in"

" Keywords
setlocal iskeyword+=-
setlocal iskeyword+==
setlocal iskeyword+=>
setlocal iskeyword+=:
syn keyword basicLanguageKeywords assert check-sat get-proof get-model declare-sort define-sort declare-const declare-fun set-option forall :pattern exit define-fun get-value declare-datatypes
syn keyword types Bool Int Real
syn keyword bool_const false true
syn keyword operators and or not => = iff distinct > >=
syn match comments ";.*$"
syn match forall_vars "?[a-zA-Z0-9_]*"


let b:current_syntax = "smt-lib"

hi def link basicLanguageKeywords   Statement
hi def link comments                Comment
hi def link bool_const              Boolean
hi def link operators               Operator
hi def link types                   Type
hi def link forall_vars             Identifier
