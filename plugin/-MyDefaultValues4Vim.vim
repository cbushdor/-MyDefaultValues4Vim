" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-07-12 15:19:14
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.221
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

if exists('g:loaded_MyDefaultValues4Vim')
	finish
endif

let g:loaded_MyDefaultValues4Vim = 1

" We put on line all variables from here
execute "source  "..expand('<sfile>:p:h').."/../mylibrary/ConfFile_MyDefaultValues4Vim.vim"

"let s:local_path_vimrc = expand('<sfile>:p:h').."/../vimrc" " path to vimrc that contains files
"let g:toLoad=expand("%:p") " Current file name to load
let g:toLoad=GetsCurrentFileName()  " Current file name to load
"echo "------------------------->".. g:toLoad

" echo "ooooooooooooooooooooooooooo>"..g:local_path_mylibrary

" We plug my local library
call LoadSource(g:local_path_mylibrary.."/locallib.vim")

" Function that is loading files from a specific directory
function! ListAllFiles(path,filt)
	let rfil=split(globpath(a:path,a:filt),'\n') " We list all file(s) within a:path with the extension a:filt
	for file in rfil
		"		echo "Loading "..expand("<sfile>:t")..": "..file
		call LoadSource(file) " We load pluggin with extension a:filt
		"execute "source "..file 
	endfor
endfunction

function! GoGetIt()
	call StartsLoading(g:local_path_mylibrary,g:pathConf) " Needed to load env variable to use plug installed in this directory

	" We load all files that have a specific extension filt (filter) from a
	" specific directory path
	call ListAllFiles(g:local_path_vimrc,'*.vim')
endfunction

call GoGetIt()
