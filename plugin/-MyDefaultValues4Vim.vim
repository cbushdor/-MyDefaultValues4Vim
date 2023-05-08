" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-05-08 22:57:19
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.85
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 	When plugin installed in .vimrc cannot access to function defined
" 	We need to source it to access to its content.
" 	To make it work use the following in ~/.vimrc
"
" 		Where variables:
" 			* path: path to where plugin is stored
" 			* plug: plugin directory name
" 		function! StartsLoading(path,plug)
" 					execute "source "..a:path..a:plug.."/plugin/"..a:plug..".vim" 
"			endfunction
"
"		  call StartsLoading('~/.vim/plugged/','-MyDefaultValues4Vim')
" ------------------------------------------------------

if exists('g:loaded_MyDefaultValues4Vim')
	finish
endif
let g:loaded_MyDefaultValues4Vim = 1

if !exists('g:true')
	let g:true = 0
endif

if !exists('g:false')
	let g:false = !g:true
endif

" function! MyDefaultValues4Vim#myecho()
function! Myecho()
	echo "hello"
endfunction
