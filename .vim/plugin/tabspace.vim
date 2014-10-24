" Name: Tab Space
" Author: Name5566 <name5566@gmail.com>
" Version: 0.1.0

if exists('loaded_tabspace')
	finish
endif
let loaded_tabspace = 1

let s:savedCpo = &cpo
set cpo&vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:Tab2Space()
	set expandtab
	%retab!
endfunction

if !exists(':Tab2Space')
	command -nargs=0 Tab2Space :call s:Tab2Space()
endif

function! s:Space2Tab()
	set noexpandtab
	%retab!
endfunction

if !exists(':Space2Tab')
	command -nargs=0 Space2Tab :call s:Space2Tab()
endif

let &cpo = s:savedCpo
