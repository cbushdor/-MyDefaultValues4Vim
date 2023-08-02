" ------------------------------------------------------
" Created By : sdo
" File Name : ConfFile_MyDefaultValues4Vim.vim
" Creation Date :2023-07-05 15:03:48
" Last Modified : 2023-08-01 23:53:40
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.68
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 	Store all files
" ------------------------------------------------------

if exists('g:MyDefaultValues4Vim_loaded_ConfFile_MyDefaultValues4Vim')
  finish
endif

let g:MyDefaultValues4Vim_loaded_ConfFile_MyDefaultValues4Vim = 1

"echo "1==========================>"..expand('<sfile>:p:h')
let g:current_path=expand('<sfile>:p:h')

let g:file_ext_ref = "."..expand("%:e") " this file ref for extension comp
"echo "2.1==========================>"..g:file_ext_ref

"echo "2==========================>"..g:current_path
let g:local_path_homedir = substitute(g:current_path,'\v(\/[^\/]+){1}$','',"")..'/' " path to vimrc that contains files
"echo "3==========================>"..g:local_path_homedir
let g:local_path_vimrc = g:local_path_homedir.."vimrc/" " path to vimrc that contains files
let g:local_path_mylibrary =  g:local_path_homedir.."mylibrary/" " path to mylibrary that contains files
let g:pathConf = 'MYVIMRC' " File that contains local configuration

function! LoadSource(file)
  execute "source "..a:file
endfunction

function! GetsCurrentFileName()
  return expand("%:p")
endfunction

" We create a envarionment variable string 
function! CreatesEnvVar(en)
  return 'g:my_auto_'..a:en " We take file associated with script name and create environment variable/memory associated
endfunction

" Load global extension that start with suf(ix)
function! LoadGlobVar(suf)
  for i in keys(g:)
    if i =~ a:suf
      echo "---->"..i.."<----"
    endif
  endfor
endfunction

