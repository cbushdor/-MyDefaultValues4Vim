<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2023-07-03 01:59:29
* Email Address : sdo@dorseb.ddns.net
* Version : 0.0.0.109
* License : 
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
* 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
------------------------------------------------------ -->

[![License: CC BY-NC 3.0](https://img.shields.io/badge/License-CC_BY--NC_3.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/3.0/)

# -MyDefaultValues4Vim

# Technical requirements

- [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor))[^1][^3] (text editor): Version 9.0.1050.
- System [macOS](https://en.wikipedia.org/wiki/MacOS): Version 13.2.1 (22D68).
- System [Fedora](https://getfedora.org/) (not fully tested yet): Version 38beta (Should work on other linux [distros](https://en.wikipedia.org/wiki/List_of_Linux_distributions) too).
- Scripts: [Markdown](https://en.wikipedia.org/wiki/Markdown), [Vim Script](https://en.wikipedia.org/wiki/Vim_(text_editor)#Vim_script) (several writings s.a VimScript or VimL can be found). The [Vim 9 script](https://vimhelp.org/vim9.txt.html#) is not used in scripts yet.
- Vim plugin: [Vim-plug](https://github.com/junegunn/vim-plug).


>***Note***
>
> Should be ok as long as Vim Script is supported by the editor (since version 8.0).

## Installing this plugin with vim-plug

**Install vim-plug so that it auto-loads at launch with:**

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Create a ~/.vimrc file (if you don't have one already), and enter this text:

```
call plug#begin()
Plug 'cbushdor/-MyDefaultValues4Vim'
call plug#end()

```

then exit from vim and *vim ~/.vimrc* or at command line type:

```
:source %
```

or

```
:so %
```

Finally, at command line in vim type:
```
:PlugInstall
```

Wait for the plugins to be downloaded.

# How to add *a new feature*

We enhanced the script. For now, it is strictly recommended that you create a file that contains the script. Don't mix with this file anymore. Here we created  *DeleteTrailingWS_txt* file name and its content:

```
function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
```

When you open a file a prompt will ask you to fill these values or you can do it by yourself in  * ~/.vim/plugged/-MyDefaultValues4Vim/vimrc/.myvimrc * .
```
let g:my_auto_DeleteTrailingWS=g:true
```

For the time being this feature can be done *by hand* or when you open a file. There is a question asked for each new pluggin installed (or as long as *g:my_auto_< filename >* is not found in ~/.vimrc for instance). Possible values are g:true for true or g:false for false. The value true load the module, false ignore it. It is mandatory to have that..

# A final configuration:

```
call plug#begin()
Plug 'cbushdor/-MyDefaultValues4Vim'
call plug#end()
```

# Modules

These files were added in *vimrc* directory[^4]. They have *.vim* extenstion. they are loaded by default once put in this directory.

* base.vim: added for test pupose.
* DeleteTailingWS.vim: delete tring white spaces when file is save *:w* for i.e.	


# WATCHOUT

Plugin not finished yet! Subject to change.

# License

Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.

[^1]: About [Vim](https://www.vim.org/about.php).
[^2]: How to install [Vim plugin](https://linuxhandbook.com/install-vim-plugins/).
[^3]: This code was based on [Vim documentation](https://vimdoc.sourceforge.net/).
[^4]: This is where the vimrc directory is *~/.vim/plugged/-MyDefaultValues4Vim* in our case.
