command! MakeTags  !ctags -R --exclude=.git --exclude=node_modules
command! SaveVimrc !cat ~/.config/nvim/shared/*.vim | sed -e '/^ *$/d;/^".*/d' > ~/.vimrc
