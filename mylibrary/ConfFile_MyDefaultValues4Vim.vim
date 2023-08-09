" ------------------------------------------------------
" Created By : sdo
" File Name : ConfFile_MyDefaultValues4Vim.vim
" Creation Date :2023-07-05 15:03:48
" Last Modified : 2023-08-06 23:56:17
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.106
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 	Store all files
" ------------------------------------------------------

if !has("g:true")
	let g:true = 1
endif

if !has("g:false")
	let g:false = 0
endif

let g:current_path=expand('<sfile>:p:h') " We get current path
let g:local_path_homedir = substitute(g:current_path,'\v(\/[^\/]+){1}$','',"")..'/' " path to vimrc that contains files
let dirs=split(g:local_path_homedir,'/') " Split by separator g:local_path_homedir
let g:module_name=substitute(dirs[len(dirs)-1],'-','',"") " we get module name from homedir path

" Define predifined global variable
function! MyDefine(var)
  if !exists("g:".g:module_name."_".a:var)
    exe "let g:".g:module_name."_".a:var ."=1"
    return g:true
  endif
  return g:false
endfunction

" if exists('g:MyDefaultValues4Vim_loaded_ConfFile_MyDefaultValues4Vim')
if !MyDefine("loaded_ConfFile")
  finish
endif

let g:file_ext_ref = "."..expand("%:e") " this file ref for extension comp
"echo "2.1==========================>"..g:file_ext_ref

echo g:local_path_homedir .. " =>(path - module)<= " .. g:module_name
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
function! LoadGlobVar(...)
  for i in keys(g:)
    for j in 1..a:0
      if i =~ get(a:,j,0)
        echo "LoadGlobVar: "..get(a:,j,0)..":---->"..i.."<----"
      endif
    endfor
  endfor
endfunction

