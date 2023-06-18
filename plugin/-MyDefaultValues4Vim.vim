" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-06-18 14:03:13
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.138
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

let s:local_path_vimrc = expand('<sfile>:p:h')."/../vimrc/" " path to vimrc that contains files

" Function that is loading files from a specific directory
function! ListAllFiles(path,filt)
	let rfil=split(globpath(a:path,a:filt),'\n')
	for file in rfil
		echo "Loading "..expand("<sfile>:t")..": "..file
		execute "source "..file
	endfor
endfunction

" We load all files that have a specific extension filt (filter) from a
" specific directory path
call ListAllFiles(s:local_path_vimrc,'*.vim')
