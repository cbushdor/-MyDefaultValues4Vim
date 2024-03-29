" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-09-24 22:41:43
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.750
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------


" We put on line all variables from here
execute "source  "..expand('<sfile>:p:h').."/../mylibrary/ConfFile_MyDefaultValues4Vim.vim"

if !MyDefine('loaded_MyDefaultValues4Vim')
	finish
endif

autocmd BufNewFile,BufReadPre * exe ":call MyStart()"

function! MyStart()
	let MyArray = [["Hi my test are here ",':hi MyColor  term=bold ctermfg=Blue guifg=#80a0ff gui=bold'], ["Hello my test are here ",':hi MyColor  term=bold ctermfg=Cyan guifg=#80a0ff gui=bold'] ]
	call AddToPrintColorString(MyArray,"Howdy my test are here ",':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold')
	call PrintsColoredString(MyArray)
	call ClearStringColor(MyArray)
	echo "-"
	call PrintsColoredString(MyArray)
	echo "-"
	call AddHeadStringColor(MyArray,["22 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echo ""
	call AddHeadStringColor(MyArray,["23 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=Green guifg=#80a0ff gui=bold'])
	call AddHeadStringColor(MyArray,["24 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=Blue guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echo "-"
	call AddHeadStringColor(MyArray,["25 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=yellow guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echo "-"
	call AddStackStringColor(MyArray,["26 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=blue guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echo "-"
	echohl WarningMsg
	let a = input(" 2 new tests:")
	echohl None

	let g:toLoad=GetsCurrentFileName()  " Current file name to load

	" We plug my local library
	call LoadSource(g:local_path_mylibrary.."/locallib.vim")
	call GoGetIt()
endfunction

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
	echo "Results("..expand("<sfile>:t").." - "..expand("%") .. ")..."
	"let varEnv = LoadGlobVar("MyDefaultValues4Vim_","my_auto_","_vim")
	"let varEnv = LoadGlobVar("my_auto_")
endfunction

" ------------------------------------------------------
" Created By : sdo
" File Name : -MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-09-24 02:09:44
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.750
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------


" We put on line all variables from here
execute "source  "..expand('<sfile>:p:h').."/../mylibrary/ConfFile_MyDefaultValues4Vim.vim"

if !MyDefine('loaded_MyDefaultValues4Vim')
	finish
endif

autocmd BufNewFile,BufReadPre * exe ":call MyStart()"

function! MyStart()
	let MyArray = [["Hi my test are here ",':hi MyColor  term=bold ctermfg=Blue guifg=#80a0ff gui=bold'], ["Hello my test are here ",':hi MyColor  term=bold ctermfg=Cyan guifg=#80a0ff gui=bold'] ]
	call AddToPrintColorString(MyArray,"Howdy my test are here ",':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold')
	call PrintsColoredString(MyArray)
	call ClearStringColor(MyArray)
	echo ""
	call PrintsColoredString(MyArray)
	echo ""
	call AddHeadStringColor(MyArray,["New Howdy my test are here ",':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echo ""
	call AddStackStringColor(MyArray,["23 New Howdy my test are here ",':hi MyColor  term=bold ctermfg=Green guifg=#80a0ff gui=bold'])
	call PrintsColoredString(MyArray)
	echohl WarningMsg
	let a = input(" 2 new tests:")
	echohl None

	let g:toLoad=GetsCurrentFileName()  " Current file name to load

	" We plug my local library
	call LoadSource(g:local_path_mylibrary.."/locallib.vim")
	call GoGetIt()
endfunction

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
	echo "Results("..expand("<sfile>:t").." - "..expand("%") .. ")..."
	"let varEnv = LoadGlobVar("MyDefaultValues4Vim_","my_auto_","_vim")
	"let varEnv = LoadGlobVar("my_auto_")
endfunction

