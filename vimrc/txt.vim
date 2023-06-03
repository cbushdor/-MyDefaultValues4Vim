" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-03 17:19:47
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.413
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

"echo ":::::::::::::::::>"..expand("<sfile>:p:h")
let s:myLoScPath=expand("<sfile>:p:h")
"let g:toto=glob(s:myLoScPath.."/*_txt")
"echo "*****************>"..g:toto

for f in split(glob(s:myLoScPath.."/*_txt"),"\n") " We read the files that ciontains the script to be loaded
	echo "uuuuuuuu>"..f
	if !CheckValue('g:my_auto_DeleteTrailingWS')
		:q
	else
		let cur = "."..expand("<sfile>:t:r") " this file ref for extension comp
		let fext= "."..expand("%:e") " opened file extension
		let $FEX= "*."..expand("<sfile>:t:r")

		if cur == fext
			"echo "ooooooooooooooooooooooooooooooooooo>".. "source "..f
			execute "source "..f
			autocmd BufWritePre,FileWritePre $FEX  :call DeleteTrailingWS()
			echo "DeleteTrailingWS() enabled..."
		endif
	endif
endfor
"echo "-----------------------------------"
