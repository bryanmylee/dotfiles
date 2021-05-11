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

### Global gitignore

To set up environment-specific files to ignore system-wide, configure the global excludes file.

```bash
git config --global core.excludesfile ~/.gitignore
```

## Dependencies

### zsh

[zsh](http://zsh.sourceforge.net) is used for this configuration.

### tmux

[tmux](https://github.com/tmux/tmux/wiki) is used for session persistance and window management.

### Neovim

[Neovim](https://neovim.io) is the editor of choice.

To install all plugins, install [vim-plug](https://github.com/junegunn/vim-plug).

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then, open a Neovim buffer, and run `:PlugInstall`. This will install all Neovim plugins, as well as all [coc.nvim](https://github.com/neoclide/coc.nvim) extensions.

### Node.js and npm

[Node.js](https://nodejs.org/en/) and [npm](https://www.npmjs.com) is required by coc.nvim, the Intellisense engine used for Neovim.

### Python

In addition, Neovim will require an installation of Python and the [neovim](https://pypi.org/project/neovim/) package.

### fzf

[fzf](https://github.com/junegunn/fzf) is used system-wide and within Neovim to provide fuzzy file-finding.

### nnn

[nnn](https://github.com/jarun/nnn) for navigation commmands.

