# dotfiles

## How to restore

### Basic tools

Install homebrew & git manually:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git 
```

### Set up

1. setup oh-my-zsh:

    1.1 install oh-my-zsh:
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    1.2 install zsh-syntax-highlighting plugin:
    ```bash
    git clone --filter=blob:none https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    1.3 install zsh-autosuggestions plugin:
    ```bash
    git clone --filter=blob:none https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
    1.4 install Powerlevel10k theme:
    ```bash
    git clone --filter=blob:none https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

2. clone dotfiles repo:

    ```bash
    git clone --filter=blob:none https://github.com/waynerv/dotfiles.git ~/dotfiles 
    ```

3. install homebrew formulaes & casks:

    ```bash
    brew bundle install --file ~/dotfiles/Brewfile --verbose
    ```

4. install pipx packages:

    ```bash
    for p in $(cat ~/dotfiles/pipx.json | jq -r '.venvs[].metadata.main_package.package_or_url'); do pipx install --index-url https://pypi.tuna.tsinghua.edu.cn/simple $p; done
    ```

5. restore dotfiles using stow:

    ```bash
    mkdir -p ~/.config ~/.ssh
    cd ~/dotfiles
    stow --adopt */
    git reset --hard
    ```

6. install dev-tools using mise:

    ```bash
    cd ~
    mise install
    ```

7. install nerd font from https://www.nerdfonts.com/font-downloads:
    - Hack Nerd Font Mono
    - DejaVuSansM Nerd Font Mono

8. install tmux-256color terminfo:
    
    ```bash
    /usr/bin/tic -x -o $HOME/.local/share/terminfo ~/dotfiles/tmux-256color.src
    ```

9. import configuration file of iterm2 and raycast.

10. configure macOS system defaults(need reboot):

    ```bash
    defaults -currentHost write -g AppleFontSmoothing -int 0
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    ```

## How to backup

### add new package

```bash
mkdir -p ~/dotfiles/<package>
mv ~/<dotfile> ~/dotfiles/<package>/<dotfile>
cd ~/dotfiles
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

### backup package updates

just run `make backup`. This will backup homebrew and pipx changes:

```bash
brew bundle dump --describe --force --file=~/dotfiles/Brewfile
pipx list --json > ~/dotfiles/pipx.json
```
