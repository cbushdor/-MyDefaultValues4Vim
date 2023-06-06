" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-06-06 23:41:37
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.569
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

if exists("g:txt_vim")
	finish
endif

let g:txt_vim=1

let s:myLoScPath=expand("<sfile>:p:h") " We Load the script path where this file is stored

execute "source "..s:myLoScPath.."/../mylibrary/locallib.vim"
"try
"	"call MyRaiseError("Just a test",OUTPUT)
"	"call MyRaiseError("Just a test",ERROR)
"catch /ERROR/
"	echo "tutu"
"	q
"catch /OUTPUT/
"	echo "titi"
"	q
"finally
"	echo "Zoed"
"endtry

"echo "::::::::::::::::::::::::::"
"for f in split(glob(s:myLoScPath.."/*_txt"),"\n") " We read the files from this path that contains the scripts [*_txt] to be loaded
for f in split(glob(s:myLoScPath.."/*_txt"),"\n") " We read the files from this path that contains the scripts [*_txt] to be loaded
	let dir = split(f,'/') " Prune out names from current path
	let file = split(dir[len(dir)-1],'_') " We take the last file name and we remove separator
	let confFile = 'g:my_auto_'..file[0] " We take file associated with script name and create environment variable/memory associated

	"<====>"..file[0]

	if !CheckValue(confFile) " We check if  variable/memory exists
		"echo confFile.." not loaded...but exists...change its value!"
"		:q
		echo "..........................loading("..f..")   ====>"..confFile.."=not defined"
	else
		let cur = "."..expand("<sfile>:t:r") " this file ref for extension comp
		let fext= "."..expand("%:e") " opened file extension
		let $FEX= "*."..expand("<sfile>:t:r")

		echo "..........................loading("..f..")   ====>"..confFile.."="
		echon get(g:,'my_auto_'..file[0]) == g:true ? "true" : "false"
		"echo "if "..cur.." == "..fext.." && "..cur.." == "..file[1] 
		if cur == fext " && expand("<sfile>:t:r") == file[1] 
			execute "source "..f
			autocmd BufWritePre,FileWritePre $FEX  :call DeleteTrailingWS()
			echo "DeleteTrailingWS() enabled..."
		endif
	endif
endfor
