<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2023-05-10 04:50:32
* Email Address : sdo@dorseb.ddns.net
* Version : 0.0.0.20
* License : 
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
* 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
------------------------------------------------------ -->

[![License: CC BY-NC 3.0](https://img.shields.io/badge/License-CC_BY--NC_3.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/3.0/)

# -MyDefaultValues4Vim

## Prerequisites

Put the following code at the begining of ~/.vimrc

```
function! StartsLoading(path,plug)
  let l:pathPlug = a:path.."/"..a:plug

  if !empty(glob(l:pathPlug))
    execute "source "..l:pathPlug
  endif
endfunction

call StartsLoading('~','.myvimrc')
```

### Parameters

* path: home directory where the pluggin/file to reach.
* plug: file to reach (can include sub dir to reach file).


## Installing plugins with vim-plug

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

call StartsLoading('~','.myvimrc')

call plug#begin()
Plug 'cbushdor/-MyDefaultValues4Vim'
call plug#end()

function! StartsLoading(path,plug)
   execute "source "..a:path..a:plug.."/plugin/"..a:plug..".vim"
endfunction

call StartsLoading('~/.vim/plugged/','-MyDefaultValues4Vim')
```

# License

Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.

