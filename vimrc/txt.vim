" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-03 22:23:55
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.429
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

let s:myLoScPath=expand("<sfile>:p:h") " We Load the script path where this file is stored

for f in split(glob(s:myLoScPath.."/*_txt"),"\n") " We read the files from this path that contains the scripts [*_txt] to be loaded
	let dir = split(f,'/') " Prune out names from current path
	let file = split(dir[len(dir)-1],'_') " We take the last file name and we remove separator
	let confFile = 'g:my_auto_'..file[0] " We take file associated with script name and create environment variable/memory associated

	if !CheckValue(confFile) " We check if  variable/memory exists
		:q
	else
		let cur = "."..expand("<sfile>:t:r") " this file ref for extension comp
		let fext= "."..expand("%:e") " opened file extension
		let $FEX= "*."..expand("<sfile>:t:r")

		if cur == fext
			execute "source "..f
			autocmd BufWritePre,FileWritePre $FEX  :call DeleteTrailingWS()
			echo "DeleteTrailingWS() enabled..."
		endif
	endif
endfor
