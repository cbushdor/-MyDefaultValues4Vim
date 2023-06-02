<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2023-06-02 22:26:16
* Email Address : sdo@dorseb.ddns.net
* Version : 0.0.0.52
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
- Scripts: [Markdown](https://en.wikipedia.org/wiki/Markdown), [Vim Script](https://en.wikipedia.org/wiki/Vim_(text_editor)#Vim_script).
- Vim plugin: [Vim-plug](https://github.com/junegunn/vim-plug).


>***Note***
>
> Should be ok as long as Vim Script is supported by the editor (since version 8.0).

## Prerequisites

Put the following code at the begining of ~/.vimrc

```
function! StartsLoading(path,plug)
  let l:pathPlug = a:path.."/"..a:plug

  if !empty(glob(l:pathPlug))
    execute "source "..l:pathPlug
  endif
endfunction

" We load personal file for configuration
call StartsLoading('~','.myvimrc')
```

### Parameters

* path: home directory where the pluggin/file can be reached.
* plug: file to reach (can include sub dir to reach file).

### Don't mixup with local config

We can create for instance a file *~/.myvimrc* that contains:

```
let g:true = 1
let g:false = 0

function! MyRaiseError(mess)
	echoerr(a:mess)
endfunction

function! CheckValue(myvar)
	try
		if !exists("g:true") " We check if g:true exists
			call MyRaiseError("o:true does not exist!")
		endif
		if !exists("g:false") " We check if g:false exists
			call MyRaiseError("g:false does not exist!")
		endif

		let d =  exists(a:myvar) " Variable detected

		"echo "============>"..a:myvar.." detected!"
		if d " memory exists we check if extension exists to return content of memory
			let r = split(a:myvar,':')
			if r[0] == 'g' " Scope is g
				let p = g:
			elseif r[0] == 's' " Scope is s
				let p = s:
			elseif r[0] == 'l' " Scope is l 
				let p = l:
			elseif r[0] == 'w' " Scope is w 
				let p = w:
			elseif r[0] == 'b' " Scope is b 
				let p = b:
			elseif r[0] == 't' " Scope is t 
				let p = t:
			elseif r[0] == 'v' " Scope is v 
				let p = v:
			elseif r[0] == 'a' " Scope is a 
				let p = a:
			else " no scope but memory exists
				call MyRaiseError(a:myvar.." error! You'd better read :help internal-variables.")
			endif
			return get(p,r[1]) " we return content of memory passed
		else " we know that mem does not exists 
			call MyRaiseError(a:myvar.." is not declared properly! You'd better read :help internal-variables.")
			return g:false
		endif
		return g:false
	catch
		echom "ERROR: " .. v:exception
	endtry
endfunction
```

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

Each time you want to install a plugin, you must enter the name and location of the plugin between the **plug#begin()** and **plug#end** lines.

If the plugin you want isn't hosted on GitHub, then you can provide the full URL instead of just the GitHub username and project ID. You can even "install" local plugins outside of your ~/.vim directory.

Finally, start Vim and prompt vim-plug to install the plugins listed in ~/.vimrc:
```
:PlugInstall
```

Wait for the plugins to be downloaded.

To update type one of those comands:
```
:PlugUpdate
```
```
:PlugUpdate -MyDefaultValues4Vim
```

# An issue met
I noticed that, when a plugin is installed, within *.vimrc* we cannot access nor function(s) or some values defined from withing this new pluggin installed... 
May be I am new to vim scripting?

# A final configuration:

```
function! StartsLoading(path,plug)
  let l:pathPlug = a:path.."/"..a:plug

  if !empty(glob(l:pathPlug))
    execute "source "..l:pathPlug
  endif
endfunction

" We load personal file for configuration
call StartsLoading('~','.myvimrc')

call plug#begin()
Plug 'cbushdor/-MyDefaultValues4Vim'
call plug#end()

" We load plugin
call StartsLoading('~/.vim/plugged/','-MyDefaultValues4Vim')
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
