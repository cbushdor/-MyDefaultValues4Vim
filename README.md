<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2024-02-18 02:11:31
* Email Address : cbushdor@laposte.net
* Version : 0.0.0.188
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
- [Shell](https://en.wikipedia.org/wiki/Unix_shell): zsh[^7] is used, but other shell should be ok (not tested yet).
- Vim plugin: [Vim-plug](https://github.com/junegunn/vim-plug).


>***Note***
>
> Should be ok as long as Vim Script is supported by the editor (since version 8.0).

## Installing this plugin with vim-plug

**Prequisites**

You must have git installed[^6]!

The following was adapted from [this](https://github.com/junegunn/vim-plug) or the cabbage leaf[^2].

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

Finally, start or restart Vim again and, go to prompt , as below, and use vim-plug to install the new plugin listed in ~/.vimrc:

```
:PlugInstall
```

Wait for the plugins to be downloaded.

To update type one of those commands:
```
:PlugUpdate
```
or

```
:PlugUpdate -MyDefaultValues4Vim
```

# How to add *a new feature* within plugin

We are in the script name **DeleteTrailingWS_txt** stored in *~/.vim/plugged/-MyDefaultValues4Vim/vimrc*.

Each time you want to add a plugin go in that directory  *~/.vim/plugged/-MyDefaultValues4Vim/vimrc*.

Just below, we created  *DeleteTrailingWS_txt* file name and, here its content (as an exemple):

```
" To avoid finite loop when loading
if !MyDefine('DeleteTrailingWS_txt')
	finish
endif

function! DeleteTrailingWS()
	exe "normal! mz"
	%s/\s\+$//ge
	exe "normal! 'z"
endfunction

" This is *.txt, it can be replaced by different extension here it works with file s.a foo.txt
" This is called when we save the file with the command :w
autocmd BufWritePre,FileWritePre *.txt :call DeleteTrailingWS()
```

Now, when first load or at first time of use after setup, a serie of questions is asked (*path+config file name if different from default*). If you want to install a module but don't want to be loaded yet then, set variable to *false* otherwise to *true* during install period (check exemple below) or directly in configure file (see later)[^5]. This script works only with files that has extension *\*.txt*. The following values are stored in **~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC** (that's default):

```
if !has("g:my_auto_DeleteTrailingWS")
let g:my_auto_DeleteTrailingWS=g:true " 	My comment for DeleteTrailingWS_txt
endif
```

For the time being this feature can be done *by hand* or when you open a file. There is a question asked for each new pluggin installed (or as long as *g:my_auto_< filename >* is not found in memory for instance. For now on, it is store in **~/.vim/plugged/-MyDefaultValues4Vim/mylibrary/MYVIMRC**). Possible values are g:true for true or g:false for false. The value true load the module, false ignore it. It is mandatory to have that.

# Modules

These files were added in *vimrc* directory[^4]. They have *_txt* extenstion previosly they were *.vim* this is now deprecated.

* base_txt: added for test pupose.
* DeleteTailingWS_txt: Delete Trailing White Spaces when file is save with command *:w* .	

# WATCHOUT

Plugin not finished yet! Subject to change. MIGHT EXPERIMENT WEIRD BEHAVIORS!

# License

Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.

[^1]: About [Vim](https://www.vim.org/about.php).
[^2]: How to install [Vim plugin](https://linuxhandbook.com/install-vim-plugins/).
[^3]: This code was based on [Vim documentation](https://vimdoc.sourceforge.net/).
[^4]: This is where the vimrc directory is *~/.vim/plugged/-MyDefaultValues4Vim* in our case.
[^5]: This process is repeted as long as the module(s) is/are not registered in the configure file.
[^6]: Getting Started - [Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
[^7]: What is shell [zsh](https://en.wikipedia.org/wiki/Z_shell).

# CAVEATS

If a file is closed with *:x* command, fields are not updated properly.


# Credits

To [Vim](https://www.vim.org/).

Made from/Based on some examples from [Fandom](https://vim.fandom.com/) examples!

# Contact

Email Address : cbushdor@laposte.net
