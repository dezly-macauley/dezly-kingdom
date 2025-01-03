#______________________________________________________________________________
# SECTION: Python Globally Installed Packages 

# This where programs that are installed with `pip install name-of-program`
# will be installed to
# export PATH="$HOME/.pip-global-pkgs:$PATH"

#______________________________________________________________________________
# SECTION: Rust Installed Programs 

# This where Rust programs that are installed and need to be available
# system-wide will go
export PATH="$HOME/.cargo/bin:$PATH"
#______________________________________________________________________________
# SECTION: JavaScript Installed Programs 

# This where npm packages (JavaScript ecosystem) 
# that are installed and need to be available system-wide will go
export PATH="$HOME/.npm-global-pkgs/bin:$PATH"

#______________________________________________________________________________
# SECTION: Configuration Management

# Use these aliases to edit the files that are currently on your system

# Version Control and Shell
alias edit-git="cd ~ && nvim .gitconfig"
alias edit-zsh="cd ~ && nvim .zshrc"

# Graphical Applications
alias edit-ghostty="cd ~/.config/ghostty/ && nvim config"
alias edit-hyprland="cd ~/.config/hypr/ && nvim hyprland.conf"

# Terminal Applications
alias edit-neovim="cd ~/.config/nvim && nvim init.lua"
alias edit-yazi="cd ~/.config/yazi/ && nvim yazi.toml"

# Central Configuration
alias kingdom="cd ~/.dezly-kingdom"

# Update the config-archive in dezly-kingdom
# Think of this as making a backup of your current configurations

function update_config_archive() {
    update_config_archive_git
    update_config_archive_zsh
    update_config_archive_ghostty
    update_config_archive_hyprland
    update_config_archive_yazi
    update_config_archive_neovim
    echo " "
    echo "🏰 Your config archive has been updated"
}

function update_config_archive_git() {
    rm ~/.dezly-kingdom/config-archive/git/.gitconfig
    cp ~/.gitconfig ~/.dezly-kingdom/config-archive/git
    echo "🔄 config-archive/git has been updated"
}

function update_config_archive_zsh() {
    rm ~/.dezly-kingdom/config-archive/zsh/.zshrc
    cp ~/.zshrc ~/.dezly-kingdom/config-archive/zsh
    echo "🐚 config-archive/zsh has been updated"
}

function update_config_archive_ghostty() {
    rm -rf ~/.dezly-kingdom/config-archive/ghostty/
    cp -r ~/.config/ghostty/ ~/.dezly-kingdom/config-archive
    echo "👻 config-archive/ghostty has been updated"
}

function update_config_archive_hyprland() {
    rm -rf ~/.dezly-kingdom/config-archive/hypr
    cp -r ~/.config/hypr ~/.dezly-kingdom/config-archive
    echo "🖼️ config-archive/hyprland has been updated"
}

function update_config_archive_yazi() {
    rm -rf ~/.dezly-kingdom/config-archive/yazi/
    cp -r ~/.config/yazi/ ~/.dezly-kingdom/config-archive
    echo "🦆 config-archive/yazi has been updated"
}

function update_config_archive_neovim() {
    rm -rf ~/.dezly-kingdom/config-archive/nvim/
    cp -r ~/.config/nvim/ ~/.dezly-kingdom/config-archive
    echo "💚 config-archive/nvim has been updated"
}

#______________________________________________________________________________
# SECTION: Terminal Output Settings
alias tree="tree --gitignore"  
alias ls="lsd"
#______________________________________________________________________________
# SECTION: Status Info

alias date-time='echo "⌚ $(date +"%A, %d %B %Y ( %I:%M:%S %p )")"'
alias battery-life="acpi"

#______________________________________________________________________________
# SECTION: System Settings

# Internet Connectivity
alias wifi-on="nmcli radio wifi on"
alias flight-mode="nmcli radio all off"

# Screen Brightness
alias bright-lowest="brightnessctl set 1%"
alias bright-10="brightnessctl set 10%"
alias bright-25="brightnessctl set 25%"
alias bright-half="brightnessctl set 50%"
alias bright-highest="brightnessctl set 100%"

#______________________________________________________________________________
# SECTION: Zsh Shell Settings
#______________________________________________________________________________
# SUB_SECTION: History

# Enable Shell History
HISTFILE=$HOME/.zsh_history
HISTSIZE=9000
SAVEHIST=9000

# A function to clear the shell history
shell_history_clear() {
    cat /dev/null > ~/.zsh_history && \
    rm -f ~/.zsh_history && \
    touch ~/.zsh_history && \
    exec zsh
}

# This function will disable temporarily disable the shell history
# for the current session. 
# When you re-open the terminal, the zsh history will be enabled again.
shell_history_disable() {
    unset HISTFILE
    export HISTSIZE=0
}

# A function to reload the current shell.
# This is useful for situations when you want to apply a change
# without having to close and re-open the terminal
shell_reload() {
    exec zsh
}

#______________________________________________________________________________
# SUB_SECTION: ZSH Autocompletion 

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#______________________________________________________________________________
# SUB_SECTION: Starship Shell Prompt

# Change the default zsh prompt to starship
eval "$(starship init zsh)"

#______________________________________________________________________________
# SUB_SECTION: Zsh Highlighting

# Make sure that this line is placed after the starship shell prompt
# line in this file, or else starship will cancel out the syntax highlighting 

# NOTE: Install this package first:
# sudo pacman -S --needed zsh-syntax-highlighting
source /usr/share/zsh/plugins/\
zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#______________________________________________________________________________
