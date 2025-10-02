#!/bin/bash

# setup.sh — Install Zsh, Oh My Zsh, Powerlevel10k, Plugins, and Fonts

set -e

echo "Updating system..."
sudo apt update

echo "Installing Zsh and Git..."
sudo apt install zsh git curl unzip wget fonts-powerline -y

echo "Setting Zsh as default shell for user: $USER"
chsh -s "$(which zsh)"

# Check if Oh My Zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed. Skipping..."
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

echo "Installing Powerlevel10k theme..."
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "Powerlevel10k already installed. Skipping..."
fi

echo "Installing Zsh plugins..."

[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

[ ! -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ] && \
  git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM/plugins/zsh-history-substring-search"

echo "Backing up ~/.zshrc (if not already backed up)..."
if [ ! -f "$HOME/.zshrc.bak" ]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
  echo "Backup created at ~/.zshrc.bak"
else
  echo "Backup already exists, skipping..."
fi

echo "Updating ~/.zshrc with theme and plugins..."

# Replace theme (catching robbyrussell or any previous value)
if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
  sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
else
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"
fi

# Replace plugins line properly
if grep -q '^plugins=' "$HOME/.zshrc"; then
  sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)/' "$HOME/.zshrc"
else
  echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)' >> "$HOME/.zshrc"
fi

echo "Installing Nerd Fonts (MesloLGS NF)..."
sudo mkdir -p /usr/share/fonts/meslo
cd /usr/share/fonts/meslo
if [ ! -f "Meslo.zip" ]; then
  sudo wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip
  sudo unzip -o Meslo.zip
  sudo fc-cache -fv
else
  echo "Meslo Nerd Font already downloaded."
fi

echo "Need to restart your terminal to apply changes."
source "$HOME/.zshrc"

echo ""
echo "Installation completed!"
echo "--------------------------------------------------"
echo "Next steps:"
echo "1. Run: source ~/.zshrc"
echo "2. (Optional) Log out and log back in to apply the shell change"
echo "3. In your terminal settings, set the font to MesloLGS NF"
echo "4. If prompted, configure Powerlevel10k — or run: p10k configure"
echo "--------------------------------------------------"
