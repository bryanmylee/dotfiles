# Installation

Set up `dotfiles` alias.

```bash
$ alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Prevent recursive problems by ignoring `~/.dotfiles/`.

```bash
$ echo '.dotfiles' >> .gitignore
```

Clone this repository into a bare repo at `~/.dotfiles/`.

Make sure to set up the SSH keys prior to using SSH, or use HTTPS otherwise.

```bash
$ git clone --bare https://github.com/bryanmylee/dotfiles.git $HOME/.dotfiles
```

Finally, checkout the dotfiles.

```bash
$ dotfiles checkout
```

## NeoVim

To install all plugins, install [vim-plug](https://github.com/junegunn/vim-plug).

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then, open a NeoVim buffer, and run `:PlugInstall`. This will install all NeoVim plugins, as well as all coc.nvim extensions.

[coc.nvim](https://github.com/neoclide/coc.nvim) requires an installation of [Node.js](https://nodejs.org/en/).

In addition, NeoVim will require the [Python neovim](https://pypi.org/project/neovim/) package.
