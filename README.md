# Installation

Set up `dotfiles` alias.

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Prevent recursive problems by ignoring `~/.dotfiles/`.

```bash
echo '.dotfiles' >> .gitignore
```

Clone this repository into a bare repo at `~/.dotfiles/`.

Make sure to set up the SSH keys prior to using SSH, or use HTTPS otherwise.

```bash
git clone --bare git@github.com:bryanmylee/dotfiles.git $HOME/.dotfiles
```

Finally, checkout the dotfiles.

```bash
dotfiles checkout
```

## Global gitignore

To set up environment-specific files to ignore system-wide, configure the global excludes file.

```bash
git config --global core.excludesfile ~/.gitignore
```

# Dependencies

## Terminal environment

### zsh

[zsh](http://zsh.sourceforge.net) is used for this configuration.

### zplug

[zplug](https://github.com/zplug/zplug) is used to install zsh plugins.

```sh
brew install zplug
```

## Utilities

### tmux

[tmux](https://github.com/tmux/tmux/wiki) is used for session persistance and window management.

```sh
brew install tmux
```

### bat

[bat](https://github.com/sharkdp/bat) for `cat` with syntax highlighting.

```sh
brew install bat
```

### fzf

[fzf](https://github.com/junegunn/fzf) is used system-wide and within Neovim to provide interactive fuzzy file-finding.

Install fzf key bindings and fuzzy completion with:

```sh
brew install fzf
$(brew --prefix)/opt/fzf/install
```

### fd

[fd](https://github.com/sharkdp/fd) for file finding. This is paired with fzf.

```sh
brew install fd
```

### nnn

[nnn](https://github.com/jarun/nnn) for interactive directory navigation.

```sh
brew install nnn
```

### lsd

[lsd](https://github.com/lsd-rs/lsd) for better directory listing.

```sh
brew install lsd
```

### direnv

[direnv](https://direnv.net/) to manage project environments.

## Editor

[Neovim](https://neovim.io) is the editor of choice.

```sh
brew install neoviim
```

To install all plugins, install [vim-plug](https://github.com/junegunn/vim-plug).

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then, open a Neovim buffer, and run `:PlugInstall`. This will install all Neovim plugins, as well as all [coc.nvim](https://github.com/neoclide/coc.nvim) extensions.

## Language runtimes

### asdf

[asdf](https://asdf-vm.com/) to manage language runtimes.

### Node.js and npm

[Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com) is required by coc.nvim, the Intellisense engine used for Neovim.

### Python

In addition, Neovim will require an installation of Python and the [neovim](https://pypi.org/project/neovim/) package.
