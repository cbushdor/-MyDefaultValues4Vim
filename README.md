<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2023-07-13 15:24:52
* Email Address : sdo@dorseb.ddns.net
* Version : 0.0.0.166
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

>***Note***
>
> ~/ and $HOME/ have the same meanings. They represent the *home directory* path.

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

Wait for the plugins to be downloaded and, installed properly! ;-)

# How to add a new *script*

From now on, it is *highly* recommended that you create a file (that has a specific format name) that contains the new script. Don't mix/jumble with one of these files anymore (s.a i.e *~/.vimrc*, *$HOME/.vimrc* ... a dog won't find its children otherwise ;-) ) except for install (read *Installing this plugin with vim-plug*). Now we created a new plugin that Delete Trailing White Space in a file. Here is the file name that contains our script:  *DeleteTrailingWS_txt*. That file name respect the following format s.a * *_txt*. The * represents the plugin name followed by extension *_txt*. Now here is its content:

```
function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction
```

When you open a file, at first time or when you had a new plugin, in *~/.vim/plugged/-MyDefaultValues4Vim/vimrc/\*_txt* , a prompt will ask you to fill these values (it will store in *~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC*[^5])  or you can do it by yourself in  *~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC*[^5].

```
let g:my_auto_DeleteTrailingWS=g:true
```

# How to create an *environment variable name*

For the time being this feature can be done *by hand* or when you open a file. There is a serie of question(s) asked for each new plugin installed (or as long as *g:my_auto_< filename >* is not found in *~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC* for instance). Possible values are g:true for true or g:false for false. The value true load the module, false ignore it. It is mandatory to have that otherwise the serie of question(s) will be prompted.

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

# BUG KNOWN

When used first time, if variables are not set, when loadeed after question session variables are loaded but not in mem properly. To avoid issues need to quit and restart vim.

# TODO

Change during first time the *path* and *filename* that contain configuration in *~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC*.

# License

Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.

[^1]: About [Vim](https://www.vim.org/about.php).
[^2]: How to install [Vim plugin](https://linuxhandbook.com/install-vim-plugins/).
[^3]: This code was based on [Vim documentation](https://vimdoc.sourceforge.net/).
[^4]: This is where the vimrc directory is *~/.vim/plugged/-MyDefaultValues4Vim* in our case.
[^5]: **WATCHOUT** in the near future it will be possible to configure *path* and *file name* in/from a *configure file*. This configure file will be unique (because it contains all variables that enable or disable by *true* and *false* the new plug).
