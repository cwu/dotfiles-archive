VIM_DIR      = $(HOME)/.vim
VIM_TMP      = $(HOME)/.vim-tmp
VUNDLE_DIR   = $(VIM_DIR)/bundle/vundle

AUTOJUMP_GIT = https://github.com/joelthelion/autojump.git
AUTOJUMP_DIR = /tmp/autojump

all: submodules symlinks vundle
	@echo "Now just run vim and type ':BundleInstall'"
	@echo "To install autojump run \`make autojump'"

ensure_vim_dir:
	@mkdir -p $(VIM_DIR)
	@mkdir -p $(VIM_TMP)

vundle: ensure_vim_dir
	@if [ ! -d $(VUNDLE_DIR) ] ; then \
		git clone http://github.com/gmarik/vundle.git $(VUNDLE_DIR) ; \
	else \
		cd $(VUNDLE_DIR) ; \
		echo "Updating vundle..." ; \
		git pull ; \
		cd - ; \
	fi

symlinks: ensure_vim_dir
	ln -fs $(CURDIR)/vimrc         $(HOME)/.vimrc
	ln -fs $(CURDIR)/gitconfig     $(HOME)/.gitconfig
	ln -fs $(CURDIR)/ackrc         $(HOME)/.ackrc
	ln -fs $(CURDIR)/zshrc         $(HOME)/.zshrc
	@ls -l $(VIM_DIR)/ftplugin || ln -fs $(CURDIR)/vim/ftplugin $(VIM_DIR)/ftplugin
	@ls -l $(VIM_DIR)/snippets || ln -fs $(CURDIR)/vim/snippets $(VIM_DIR)/snippets
	@ls -l $(HOME)/.oh-my-zsh  || ln -fs $(CURDIR)/oh-my-zsh    $(HOME)/.oh-my-zsh

submodules:
	@git submodule init
	@git submodule update

autojump: submodules
	@git clone $(AUTOJUMP_GIT) $(AUTOJUMP_DIR)
	@cd $(AUTOJUMP_DIR) && ./install.zsh
	@rm -r $(AUTOJUMP_DIR)
