" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-07-03 01:38:04
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.146
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

let s:myLoScPath=expand("<sfile>:p:h") " We Load the script path where this file is stored

let g:toLoad=expand("%:p") " Current file name
echo "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv>"..g:toLoad

if !has("g:true")
	let g:true = 1
endif

if !has("g:false")
	let g:false = 0
endif

" We load a plug from a given path
function! StartsLoading(path,plug)
	let g:pathPlug = a:path.."/"..a:plug

	if !empty(glob(g:pathPlug))
		execute "source "..g:pathPlug
		"echo "---->We loaded source "..g:pathPlug
	else
		echo "We cannot load source "..g:pathPlug
			let l:answ = Confirm("Would you like to create "..g:pathPlug,"y,n")
			if l:answ == g:true
				echo g:pathPlug.." created..."
				let $F = g:pathPlug
				:e $F
				:w
			else
				:q
			endif
	endif
endfunction

" Function that is loading files from a specific directory
function! ListAllFiles(path,filt)
	let rfil=split(globpath(a:path,a:filt),'\n')
	for file in rfil
"		echo "Loading "..expand("<sfile>:t")..": "..file
		execute "source "..file
	endfor
endfunction

let s:local_path_vimrc = expand('<sfile>:p:h')."/../vimrc" " path to vimrc that contains files
let s:local_path_mylibrary = expand('<sfile>:p:h')."/../mylibrary" " path to mylibrary that contains files
"execute "source "..s:myLoScPath.."/../mylibrary/locallib.vim"
call StartsLoading(s:local_path_mylibrary,"locallib.vim") " We load library
call StartsLoading(s:local_path_vimrc,'.myvimrc') " Needed to load env variable to use plug installed in this directory

" We load all files that have a specific extension filt (filter) from a
" specific directory path
call ListAllFiles(s:local_path_vimrc,'*.vim')
