" ------------------------------------------------------
" Created By : sdo
" File Name : base.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-05-08 01:53:17
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.11
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

" Important to set for the next
let g:path_local_conf = expand('<sfile>:p:h')."/../vimrc/" " path to vimrc that contains files

" We load local configuration file
source g:path_local_conf . "base.vimrc"

" We define bolean values
let g:true = 0        " We define true
let g:false = !true   " We define false

" We load the file where we can change config

function! OkFor(var)
	if exists(a:var)
		if a:var == g:true
			return g:true
		else
			return g:false
		endif
	else
		return g:false
	endif
	return g:false
endfunction
