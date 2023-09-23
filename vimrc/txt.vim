" ------------------------------------------------------
" Created By : sdo
" File Name : txt.vim
" Creation Date :1970-01-01 00:59:59
" Last Modified : 2023-09-23 02:32:34
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.621
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

"if exists("g:txt_vim")
if !MyDefine('txt_vim')
	finish
endif

"let g:txt_vim=1

let s:myLoScPath=expand("<sfile>:p:h") " We Load the script path where this file is stored

execute "source "..s:myLoScPath.."/../mylibrary/locallib.vim"

for f in split(glob(s:myLoScPath.."/*_txt"),"\n") " We read the files from this path that contains the scripts [*_txt] to be loaded
	let dir = split(f,'/') " Prune out names from current path
	let file = split(dir[len(dir)-1],'_') " We take the last file name and we remove separator
	"let confFile = 'g:my_auto_'..file[0] " We take file associated with script name and create environment variable/memory associated
	let confFile = CreatesEnvVar(file[0]) " We take file associated with script name and create environment variable/memory associated
	let resCheckVal = CheckValue(confFile,f) " We check if variable/memory exists

	if (resCheckVal == g:false) " We check if variable/memory exists or is equal to false
	else
		let cur =  "."..expand("<sfile>:t:r") " this file ref for extension comp (it has to be this file need to be here)
		let $FEX= "*"..cur " We add * to cur
		let fext= g:file_ext_ref " opened file extension

		echo "g:my_auto_"..file[0]..": ".. (get(g:,'my_auto_'..file[0]) == g:true ? "true" : "false")
		if cur == fext
			execute "source "..f
		endif
	endif
endfor
