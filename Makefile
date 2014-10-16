# These variables can be set from the command line.
BUILDDIR      = .
DOTFILES      = https://github.com/kfei/dotfiles.git

.PHONY: help vim zsh dotfiles update

help:
	@echo "Use \`make <target>\` where <target> can be:"
	@echo "    dotfiles  fetch all the dotfiles from Github"
	@echo "    vim       setup .vimrc, plugins and colors"
	@echo "    zsh       setup oh-my-zsh and plugins"
	@echo "    update    update dotfiles from upstream"

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
	cp ${BUILDDIR}/.vimrc ~/.vimrc
	-mkdir -p ~/.vim/bundle
	@echo "Installing Vundle..."
	-git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@echo "Installing Vim plugins..."
	-vim -c PluginInstall
	-mkdir -p ~/.vim/colors
	@echo "Getting Vim colorscheme..."
	-git clone https://github.com/nanotech/jellybeans.vim.git /tmp/jellybeans
	-mv /tmp/jellybeans/colors/jellybeans.vim ~/.vim/colors/
	-rm -rf /tmp/jellybeans

zsh:
	-curl -L http://install.ohmyz.sh | sh
	@echo "Customizing .zshrc..."
	@sed -i 's/robbyrussell/gentoo/g' ~/.zshrc
	@sed -i 's/plugins=(git)/plugins=()/g' ~/.zshrc
	@echo "# Now alias some hot commands..." >> ~/.zshrc
	@cp ${BUILDDIR}/scripts/aliases.sh ~/.aliases.sh
	@echo "source ~/.aliases.sh" >> ~/.zshrc
	@echo "Done."
