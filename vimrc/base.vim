" ------------------------------------------------------
" Created By : sdo
" File Name : base.vim
" Creation Date : 2023-05-08 01:30:12
" Last Modified : 2023-05-10 03:26:23
" Email Address : sdo@dorseb.ddns.net
" Version : 0.0.0.12
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" ------------------------------------------------------

echo "----->"..%
let g:monster = 1

if exists("my_auto_indent")
	echo "We detected my_auto_indent";
else
	echo "We didn't detect my_auto_indent";
endif
