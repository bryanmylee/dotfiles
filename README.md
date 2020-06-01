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
