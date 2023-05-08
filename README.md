<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2023-05-08 05:52:48
* Last Modified : 2023-05-08 05:59:45
* Email Address : sdo@dorseb.ddns.net
* Version : 0.0.0.4
* License : 
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
* 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
------------------------------------------------------ -->

# -MyDefaultValues4Vim

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
When plugin installed in .vimrc cannot access to function defined or some values. Hence, we need to source it to access to its content.

# Install extra

need to define in ~/.vimrc a variable:
* let g:path_local_conf = expand('<sfile>:p:h').."/../vimrc/" 

We need to define in ~/.vimrc a function **LoadPlug(baseplug,gitpath,path)**:

Here is the meaning of parameters:
* baseplug: where plugin is stored
* gitpath: where git is
* path: local path to reach pluggin (don't need to contains baseplug)

Then we call it (below is an example).

```
function! LoadPlug(baseplug,gitpath,path)
  call plug#begin(a:baseplug)
  Plug a:gitpath
  execute "source "..a:baseplug..a:path
  call plug#end()
endfunction

call LoadPlug('~/.vim/plugged','cbushdor/-MyDefaultValues4Vim',"/-MyDefaultValues4Vim/plugin/base.vim")
```
