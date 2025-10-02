#!/bin/bash

# uninstall.sh — Remove Zsh, Oh My Zsh, Powerlevel10k, Plugins, and Fonts

set -e

echo "Switching default shell back to bash for user: $USER"
chsh -s "$(which bash)"

echo "Restoring original ~/.zshrc if backup exists..."
if [ -f "$HOME/.zshrc.bak" ]; then
  mv -f "$HOME/.zshrc.bak" "$HOME/.zshrc"
  echo "Restored ~/.zshrc from backup."
else
  echo "No backup found, skipping..."
fi

echo "Removing Oh My Zsh..."
rm -rf "$HOME/.oh-my-zsh"

echo "Removing Powerlevel10k theme..."
rm -rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

echo "Removing Zsh plugins..."
rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search"

echo "Removing Nerd Fonts (MesloLGS NF)..."
cd /usr/share/fonts || exit
if [ -f "Meslo.zip" ]; then
  sudo rm -f Meslo.zip
  sudo rm -f MesloLGS*  # remove extracted font files
  sudo fc-cache -fv
  echo "Removed Meslo Nerd Font."
else
  echo "Meslo Nerd Font not found, skipping..."
fi

echo "Uninstalling Zsh (optional)..."
read -p "Do you also want to uninstall zsh? (y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  sudo apt remove --purge zsh -y
  sudo apt autoremove -y
  echo "Zsh removed."
else
  echo "Zsh kept installed."
fi

echo ""
echo "Uninstallation completed!"
echo "--------------------------------------------------"
echo "Next steps:"
echo "1. Log out and log back in, or restart your terminal."
echo "2. Confirm your default shell is bash by running: echo \$SHELL"
echo "--------------------------------------------------"
