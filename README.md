# dotfiles

## Install packages

### Basic tools

Install homebrew & git manually:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git 
```

### Set up

1. clone dotfiles repo:

    ```bash
    git clone https://github.com/waynerv/dotfiles.git ~/dotfiles 
    ```
2. install homebrew formula & casks:

    ```bash
    brew bundle install ~/dotfiles/Brewfile
    ```

3. install pipx packages:

    There is no command for pipx to export or import installed packages, so just use output below to install manually:
    ```bash
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
 
4. oh-my-zsh
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

5. [install nerd font](https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k)

6. Powerlevel10k
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

7. LunarVim
    ```bash
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    ```

8. install dotfiles using stow:

    ```bash
    cd ~/dotfiles
    stow */
    ```

9. install asdf packages:

    ```bash
    cd ~
    for plug in {golang,python,nodejs}; do asdf plugin add $plug; done
    asdf install
    ```

10. import configuration file of iterm2 and raycast.

## How to backup

### homebrew

```bash
brew bundle dump --describe --force --file=~/dotfiles/Brewfile
```

