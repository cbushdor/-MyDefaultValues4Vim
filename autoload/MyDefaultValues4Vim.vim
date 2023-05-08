" ------------------------------------------------------
" Created By : sdo
" File Name : MyDefaultValues4Vim.vim
" Creation Date : 2023-05-08 00:22:02
" Last Modified : 2023-05-08 20:42:30
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.60
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 	When plugin installed in .vimrc cannot access to function defined
" 	We need to source it to access to its content.
" ------------------------------------------------------

"let g:path_local_conf = expand('<sfile>:p:h').."/../vimrc/" " path to vimrc that contains files
" Put this into ~/.vimrc
" to load and source
"baseplug: where plugin is stored
"gitpath: where git is
"path: local path to reach pluggin (don't need to contains baseplug)
"
"function! LoadPlug(baseplug,gitpath,path)
"  call plug#begin(a:baseplug) "'~/.vim/plugged')
"  "Plug 'cbushdor/-MyDefaultValues4Vim'
"  Plug a:gitpath
"  "execute "source "..a:baseplug.."/-MyDefaultValues4Vim/plugin/base.vim"
"  execute "source "..a:baseplug..a:path
"  call plug#end()
"endfunction
"
"call LoadPlug('~/.vim/plugged','cbushdor/-MyDefaultValues4Vim',"/-MyDefaultValues4Vim/plugin/base.vim")
"

" We define bolean values
let g:true = 0        " We define true
let g:false = !g:true   " We define false

if !exists("true")
	echo "X----------------------->if !exists(true)"
else
	echo "X----------------------->if exists(true)"
	"	source ~/.vim/plugged/Extra/plugin/base.vim
endif
echo "*********>"..g:true

" We load the file where we can change config

function! g:OkFor(var)
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
