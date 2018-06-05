# These variables can be set from the command line.
BUILDDIR = .
DOTFILES = https://github.com/kfei/dotfiles.git
UNAME    = $(shell uname)

.PHONY: help vim vim-plugin zsh dotfiles update

help:
	@echo "Use \`make <target>\` where <target> can be:"
	@echo "    dotfiles   fetch all the dotfiles from Github"
	@echo "    vim        setup .vimrc and colors"
	@echo "    vim-plugin setup Vim plugins"
	@echo "    zsh        setup oh-my-zsh and plugins"
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

zsh:
	curl -L http://install.ohmyz.sh | sh
	@echo "Customizing .zshrc..."
	@cp ${BUILDDIR}/zsh/kfei.zsh-theme ~/.oh-my-zsh/themes/
ifeq ($(UNAME),Darwin)
	sed -i "" 's/robbyrussell/gentoo/g' ~/.zshrc
else
	sed -i 's/robbyrussell/gentoo/g' ~/.zshrc
endif
	cp ${BUILDDIR}/kfei.zsh ~/.oh-my-zsh/custom/
	@echo "Done."
