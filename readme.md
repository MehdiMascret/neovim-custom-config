# Necessaire
## Pré-nécessire
```sh

sudo apt update
sudo apt install -y build-essential procps curl file git  neovim
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
## Packages
```sh
brew install rg
brew install --cask font-jetbrains-mono-nerd-font
sudo update-alternatives --set vi /usr/bin/nvim
```
