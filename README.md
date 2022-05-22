# Waynerv's dotfiles

## Install basic tools

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git & Stow

```bash
brew install git stow
```

## Restore dotfiles

### Clone remote repo

```
git clone https://github.com/waynerv/dotfiles.git ~/dotfiles 
```

### Install dotfiles

```
cd ~/dotfiles
stow */
```

## Set up

### Homebrew

```
brew bundle install ~/dotfiles/Brewfile
```

### asdf

```
cd ~
asdf plugin add golang
asdf plugin add python
asdf plugin add nodejs
asdf install
```

### pipx

There is no command for pipx to export or import all installed packages, so just use output below to install manually:
```
❯ pipx list
venvs are in /Users/waynerv/.local/pipx/venvs
apps are exposed on your $PATH at /Users/waynerv/.local/bin
   package black 22.3.0, installed using Python 3.10.4
    - black
    - blackd
   package bpython 0.22.1, installed using Python 3.10.4
    - bpdb
    - bpython
    - bpython-curses
    - bpython-urwid
   package cookiecutter 1.7.3, installed using Python 3.10.4
    - cookiecutter
   package jinja2-cli 0.8.2, installed using Python 3.10.4
    - jinja2
   package notebook 6.4.11, installed using Python 3.10.4
    - jupyter-bundlerextension
    - jupyter-nbextension
    - jupyter-notebook
    - jupyter-serverextension
   package poetry 1.1.13, installed using Python 3.10.4
    - poetry
   package thefuck 3.32, installed using Python 3.10.4
    - fuck
    - thefuck
   package tldr 3.1.0, installed using Python 3.10.4
    - tldr
```

### Others

1. oh-my-zsh
    ```
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

2. [install nerd font](https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k)

3. powerline10k
    1) Clone the repository:
        ```zsh
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        ```
    2) Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

4. LunarVim
    ```
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    ```

## How to backup

### homebrew

```
brew bundle dump --describe --force --file=~/dotfiles/Brewfile
```

