#!/bin/bash

# setup.sh — Install Zsh, Oh My Zsh, Powerlevel10k, and Plugins on Ubuntu

set -e

echo "Updating system..."
sudo apt update

echo "Installing Zsh and Git..."
sudo apt install -y zsh git curl

echo "Setting Zsh as the default shell for user: $USER"
chsh -s $(which zsh)

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing Zsh plugins: Autosuggestions, Syntax Highlighting, History Substring Search..."

git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-history-substring-search \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

echo ""
echo "✅ Installation completed!"
echo "--------------------------------------------------"
echo "Next steps:"
echo "1. Edit ~/.zshrc:"
echo "   - Set ZSH_THEME=\"powerlevel10k/powerlevel10k\""
echo "   - Set plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)"
echo "2. Reload with: source ~/.zshrc"
echo "3. Log out and log back in to apply default shell change."
echo "--------------------------------------------------"
