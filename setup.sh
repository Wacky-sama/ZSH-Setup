#!/bin/bash

# setup.sh — Install Zsh, Oh My Zsh, Powerlevel10k, and Plugins on Ubuntu

set -e

echo "Updating system..."
sudo apt update

echo "Installing Zsh and Git..."
sudo apt install -y zsh git curl

echo "Setting Zsh as default shell for user: $USER"
chsh -s "$(which zsh)"

# Check if Oh My Zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed. Skipping..."
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k" || echo "Powerlevel10k already installed. Skipping..."

echo "Installing Zsh plugins..."

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" \
  || echo "zsh-autosuggestions already installed. Skipping..."

git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" \
  || echo "zsh-syntax-highlighting already installed. Skipping..."

git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM/plugins/zsh-history-substring-search" \
  || echo "zsh-history-substring-search already installed. Skipping..."

echo "Updating ~/.zshrc with theme and plugins..."

# Replace or append theme
sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc" \
  || echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"

# Replace or append plugins
if grep -q "^plugins=" "$HOME/.zshrc"; then
  sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)/' "$HOME/.zshrc"
else
  echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)' >> "$HOME/.zshrc"
fi

echo ""
echo "Installation completed!"
echo "--------------------------------------------------"
echo "Next steps:"
echo "1. Run: source ~/.zshrc"
echo "2. (Optional) Log out and log back in to apply the shell change"
echo "3. If prompted, configure Powerlevel10k — or run: p10k configure"
echo "--------------------------------------------------"