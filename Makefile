all:
	stow --verbose --target=$$HOME --restow */

delete:
	stow --verbose --target=$$HOME --delete */

backup:
	brew bundle dump --no-vscode --describe --force --file=~/dotfiles/Brewfile
	pipx list --json > ~/dotfiles/pipx.json
	git diff

