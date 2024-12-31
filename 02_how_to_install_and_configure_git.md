# How to install and configure Git

This guide assumes that you already have Arch Linux installed

Install Git using `pacman` (The package manager on Arch Linux)
```
sudo pacman -S git
```

Add your username:
```
git config --global user.name "your-username"
```

Add your email:
```
git config --global user.email "your-email"
```

Neovim is not installed yet, 
but I recommend setting this now so you don't forget.

Set the editor to Neovim with this command:
```
git config --global core.editor nvim
```

Set your default branch to `main`
```
git config --global init.defaultBranch main
```
