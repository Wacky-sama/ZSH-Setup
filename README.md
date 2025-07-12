# Installing Zsh and Powerlevel10k

This guide provides both **manual setup steps** and an **automated installation script**.

---

## ✅ Quick Installation Using setup.sh

If you prefer a one-command setup, simply run:

```bash
git clone https://github.com/Wacky-sama/ZSH-Setup.git
cd ZSH-Setup
chmod +x setup.sh
./setup.sh
```

## Step 1: Update and Install Zsh

```bash
sudo apt update
sudo apt install zsh -y
```

## Step 2: Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

**Note:** You need to log out and log back in for this to take effect.

## Step 3: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Step 4: Install Powerlevel10k Theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Set the theme in `.zshrc`

Edit this line:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Reload your Zsh configuration

```bash
source .zshrc
```

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

✅ You now have a fast, clean, and customized Zsh shell with Powerlevel10k and helpful plugins!
