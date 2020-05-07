# These variables can be set from the command line.
BUILDDIR = .
UNAME    = $(shell uname)

.PHONY: help vim vim-plugin dotfiles update

help:
	@echo "Use \`make <target>\` where <target> can be:"
	@echo "    dotfiles   fetch all the dotfiles from Github"
	@echo "    vim        setup .vimrc and colors"
	@echo "    vim-plugin setup Vim plugins"
	@echo "    update     update dotfiles from upstream"

dotfiles:
	cp ${BUILDDIR}/.gitconfig ~/.gitconfig
	cp ${BUILDDIR}/.screenrc ~/.screenrc
	cp ${BUILDDIR}/.tmux.conf ~/.tmux.conf

update:
	@echo "Fetching updates from Github..."
	@git pull

cleanvim:
	-rm -rf ~/.vimrc
	-rm -rf ~/.vim

vim:
	cp ${BUILDDIR}/vim/.vimrc ~/.vimrc
	-mkdir -p ~/.vim/colors
	@echo "Install Vim colorschemes..."
	-cp ${BUILDDIR}/vim/colors/*.vim ~/.vim/colors/

vim-plugin:
	-mkdir -p ~/.vim/bundle
	@echo "Install Vundle..."
	-git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@echo "Install Vim plugins..."
	-vim -c PluginInstall -c qa
