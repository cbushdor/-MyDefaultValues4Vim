" ------------------------------------------------------
" Created By : sdo
" File Name : DeleteTailingWS.vim
" Creation Date :2023-05-11 03:30:12
" Last Modified : 2023-05-11 03:41:03
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.9
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 		Example found while reading tutorial regarding vimscript.
" 		Example was gard to reproduce. I reproduce the demo by myself.
" 		The Purpose of this script is to remove trailing Wite Spaces (whatever
" 		the file type (for the time being)! ;-)
" ------------------------------------------------------

autocmd BufNewFile * :call DeleteTrailingWS()

function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
