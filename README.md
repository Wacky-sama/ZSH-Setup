# Installing Zsh and Powerlevel10k

This guide provides both **manual setup steps** and an **automated installation script**.

---

## Compatibility Notes

This setup has been tested on:

- **Ubuntu / Debian**
- **Fedora / CentOS / AlmaLinux**
- **Arch / Manjaro**
- **WSL (Windows Subsystem for Linux)**

> **Note:**  
> - Requires Zsh, Git, and Curl installed.  
> - Powerlevel10k visuals (icons and fonts) depend on your terminal supporting [Nerd Fonts](https://github.com/romkatv/powerlevel10k#manual-font-installation).  
> - On minimal or embedded Linux distributions (e.g., Alpine), extra setup may be required.

---

## Quick Installation Using setup.sh

The `setup.sh` file is already included in this repository.

If you prefer a one-command setup, simply run:

```bash
git clone https://github.com/Wacky-sama/ZSH-Setup.git
cd ZSH-Setup
chmod +x setup.sh
./setup.sh
```

---

## Step 1: Update and Install Zsh

```bash
sudo apt update
sudo apt install zsh -y
```

## Step 2: Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

> **Note:** You need to log out and log back in for this to take effect.

## Step 3: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Step 4: Install Powerlevel10k Theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Set the Theme in `.zshrc`

Edit this line and remove or comment out `robbyrussell`:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Reload Your Zsh Configuration

```bash
source .zshrc
```

## Step 5: Install Nerd Fonts (MesloLGS)
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip
unzip Meslo.zip
fc-cache -fv
```
After installation, set your terminal’s font to MesloLGS NF.

---

## Optional: Install Extra Zsh Plugins

For **Autosuggestions**, **Syntax Highlighting**, and **History Substring Search**, run:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

Then edit your `.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
```

Finally, reload again:

```bash
source .zshrc
```

---

You now have a fast, clean, and customized Zsh shell with Powerlevel10k and helpful plugins!