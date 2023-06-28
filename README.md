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

2. install homebrew formulaes & casks:

    ```bash
    brew bundle install ~/dotfiles/Brewfile
    ```

3. install pipx packages:

    ```bash
    for p in $(cat ~/dotfiles/pipx.json | jq -r '.venvs[].metadata.main_package.package_or_url'); do pipx install $p; done
    ```

4. [install nerd font](https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k)
 
5. setup oh-my-zsh:

    4.1 install oh-my-zsh:
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    4.2 install zsh-syntax-highlighting plugin:
    ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    4.3 install zsh-autosuggestions plugin:
    ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
    4.4 install Powerlevel10k theme:
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

6. install tmux plugins
    
    5.1 tmux-resurrect:
    ```bash
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
    ```
    5.2 tmux-thumbs:
    ```bash
    git clone https://github.com/fcsonline/tmux-thumbs ~/.tmux/plugins/tmux-thumbs
    ```

7. install tmux-256color terminfo:
    
    ```bash
    /usr/bin/tic -x -o $HOME/.local/share/terminfo ~/dotfiles/tmux-256color.src
    ```

8. install dotfiles using stow:

    ```bash
    cd ~/dotfiles
    stow --adopt */
    git reset --hard
    ```

9. install asdf packages:

    ```bash
    cd ~
    for plug in {golang,python,nodejs}; do asdf plugin add $plug; done
    asdf install
    ```

10. import configuration file of iterm2 and raycast.

## How to backup

### add new package

```bash
mkdir -p ~/dotfiles/<package>
mv ~/<dotfile> ~/dotfiles/<package>/<dotfile>
cd ~/dorfiles
stow <package>
```
Example:
```bash
❯ pwd
/Users/waynerv/dotfiles
❯ find nvim
nvim
nvim/.config
nvim/.config/nvim
nvim/.config/nvim/init.vim
nvim/.config/nvim/autoload
nvim/.config/nvim/autoload/plug.vim
❯ stow --target=/Users/waynerv nvim
❯ ls -l ~/.config/nvim
lrwxr-xr-x  1 waynerv  staff  29  5 21 22:36 /Users/waynerv/.config/nvim -> ../dotfiles/nvim/.config/nvim
```

### homebrew

```bash
brew bundle dump --describe --force --file=~/dotfiles/Brewfile
```

### pipx

```bash
pipx list --json > ~/dotfiles/pipx.json
```
