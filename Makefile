# Top level makefile for configuring systems the way I like 'em.

COMPONENTS=zsh oh-my-zsh tmux git vim vim-bundles

VIM_BUNDLE_URLS= \
	https://github.com/altercation/vim-colors-solarized.git \
	https://github.com/bling/vim-airline.git \
	https://github.com/cespare/vim-toml.git \
	https://github.com/Chiel92/vim-autoformat \
	https://github.com/fatih/vim-go.git \
	https://github.com/JamshedVesuna/vim-markdown-preview.git \
	https://github.com/junegunn/goyo.vim.git \
	https://github.com/justinmk/vim-gtfo.git \
	https://github.com/justinmk/vim-sneak.git \
	https://github.com/ledger/vim-ledger.git \
	https://github.com/lervag/vimtex.git \
	https://github.com/mustache/vim-mustache-handlebars.git \
	https://github.com/pangloss/vim-javascript.git \
	https://github.com/petRUShka/vim-opencl.git \
	https://github.com/racer-rust/vim-racer.git \
	https://github.com/rhysd/rust-doc.vim.git \
	https://github.com/rhysd/vim-clang-format.git \
	https://github.com/rust-lang/rust.vim.git \
	https://github.com/scrooloose/syntastic.git \
	https://github.com/sjl/vitality.vim.git \
	https://github.com/szw/vim-tags.git \
	https://github.com/tpope/vim-dispatch.git \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/tpope/vim-projectionist.git \
	https://github.com/tpope/vim-repeat.git \
	https://github.com/tpope/vim-surround.git \
	https://github.com/tpope/vim-unimpaired.git \
	https://github.com/tpope/vim-vinegar.git \
	https://github.com/vim-pandoc/vim-pandoc-syntax.git \
	https://github.com/vim-scripts/DoxygenToolkit.vim.git \
    https://github.com/airblade/vim-gitgutter.git
vim_bundle=$(addprefix vim/bundle/,$(basename $(notdir $(1))))
VIM_BUNDLES=$(call vim_bundle,$(VIM_BUNDLE_URLS))

default:

all: $(COMPONENTS)
.PHONY: $(COMPONENTS)

# We do some mad zsh action, mostly because oh-my-zsh is the bomb.
zsh: ~/.zshrc
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

~/.zshrc:
	ln -s $(CURDIR)/zshrc ~/.zshrc

oh-my-zsh: ~/.oh-my-zsh/custom

~/.oh-my-zsh/custom:
	ln -s $(CURDIR)/oh-my-zsh-custom $@

tmux: ~/.tmux.conf

~/.tmux.conf:
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf

vim: ~/.vim ~/.vimrc

vim-bundles: $(VIM_BUNDLES) | vim/bundle

~/.vimrc:
	ln -s $(CURDIR)/vimrc ~/.vimrc

~/.vim:
	ln -s $(CURDIR)/vim ~/.vim

git: ~/.gitignore_global ~/.git_template
	git config --global user.email "pete.gadomski@gmail.com"
	git config --global user.name "Pete Gadomski"
	git config --global core.editor nvim
	git config --global core.excludesfile ~/.gitignore_global
	git config --global init.templatedir ~/.git_template

~/.gitignore_global:
	ln -s $(CURDIR)/gitignore_global ~/.gitignore_global

~/.git_template:
	ln -s $(CURDIR)/git_template ~/.git_template

# Some magic to set up a target for each bundle
define VIM_BUNDLE_template
$(call vim_bundle,$(1)): | vim/bundle
	git clone $(1) $$@
endef

$(foreach url,$(VIM_BUNDLE_URLS),$(eval $(call VIM_BUNDLE_template,$(url))))

vim/bundle:
	mkdir $@
