VIM_DIR      = $(HOME)/.vim
VIM_TMP      = $(HOME)/.vim-tmp
VUNDLE_DIR   = $(VIM_DIR)/bundle/vundle

NVM_GIT = git://github.com/creationix/nvm.git
NVM_DIR = $(HOME)/.nvm

OH_MY_ZSH_GIT = https://github.com/robbyrussell/oh-my-zsh.git
OH_MY_ZSH_DIR = $(HOME)/.oh-my-zsh

XMONAD_DIR = $(HOME)/.xmonad

AUTOJUMP_GIT = https://github.com/joelthelion/autojump.git
AUTOJUMP_DIR = /tmp/autojump

all: symlinks vundle
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

symlinks: ensure_vim_dir oh_my_zsh nvm
	ln -fs $(CURDIR)/vimrc         $(HOME)/.vimrc
	ln -fs $(CURDIR)/gitconfig     $(HOME)/.gitconfig
	ln -fs $(CURDIR)/ackrc         $(HOME)/.ackrc
	ln -fs $(CURDIR)/zshrc         $(HOME)/.zshrc
	@mkdir -p $(XMONAD_DIR)
	ln -fs $(CURDIR)/xmonad.hs     $(XMONAD_DIR)/xmonad.hs
	@ls -l $(VIM_DIR)/ftplugin || ln -fs $(CURDIR)/vim/ftplugin $(VIM_DIR)/ftplugin
	@ls -l $(VIM_DIR)/snippets || ln -fs $(CURDIR)/vim/snippets $(VIM_DIR)/snippets

oh_my_zsh: $(OH_MY_ZSH_DIR)

$(OH_MY_ZSH_DIR):
	@git clone $(OH_MY_ZSH_GIT) $(OH_MY_ZSH_DIR)

autojump:
	@rm -rf $(AUTOJUMP_DIR)
	@git clone $(AUTOJUMP_GIT) $(AUTOJUMP_DIR)
	@cd $(AUTOJUMP_DIR) && sudo ./install.sh --zsh
	@rm -rf $(AUTOJUMP_DIR)

nvm: $(NVM_DIR)

$(NVM_DIR):
	@git clone $(NVM_GIT) $(NVM_DIR)
