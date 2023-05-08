# -MyDefaultValues4Vim

We need to define in ~/.vimrc a variable:
* let g:path_local_conf = expand('<sfile>:p:h').."/../vimrc/" " path to vimrc that contains files Put this into ~/.vimrc to load and source

We need to define in ~/.vimrc a function **LoadPlug(baseplug,gitpath,path)**:

Here is the meaning of parameters:
* baseplug: where plugin is stored
* gitpath: where git is
* path: local path to reach pluggin (don't need to contains baseplug)

Then we call it (below is an example).

```
function! LoadPlug(baseplug,gitpath,path)
  call plug#begin(a:baseplug) "'~/.vim/plugged')
  "Plug 'cbushdor/-MyDefaultValues4Vim'
  Plug a:gitpath
  execute "source "..a:baseplug..a:path
  call plug#end()
endfunction

call LoadPlug('~/.vim/plugged','cbushdor/-MyDefaultValues4Vim',"/-MyDefaultValues4Vim/plugin/base.vim")
```
