VIM_DIR    = $(HOME)/.vim
VIM_TMP    = $(HOME)/.vim-tmp
VUNDLE_DIR = $(VIM_DIR)/bundle/vundle

all: symlinks vundle
	@echo "Now just run vim and type ':BundleInstall'"

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
	ln -fs $(CURDIR)/vim/ftplugin  $(VIM_DIR)/ftplugin
