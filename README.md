# Installing Zsh and Powerlevel10k on Ubuntu Server

## Step 1: Update and Install Zsh

```bash
sudo apt update
sudo apt install zsh -y

## Step 2: Set Zsh as Default Shell

chsh -s $(which zsh)

Note: You need to log out and log back in for this to take effect.