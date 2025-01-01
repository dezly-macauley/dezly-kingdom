# SECTIONL Enable History

HISTFILE=$HOME/.zsh_history
HISTSIZE=9000
SAVEHIST=9000

#______________________________________________________________________________
# SECTION: Adding Directories To shell path

# This where Rust programs that are installed and need to be available
# system-wide will go
export PATH="$HOME/.cargo/bin:$PATH"

# This where npm packages (JavaScript ecosystem) 
# that are installed and need to be available system-wide will go
export PATH="$HOME/.npm-global-pkgs/bin:$PATH"

#______________________________________________________________________________
# SECTION: Update Dezly Kingdom Configurations

# Update the entire configuration
function update_dezly_kingdom() {
    update_dezly_kingdom_git
    update_dezly_kingdom_zsh
    update_dezly_kingdom_neovim
    update_dezly_kingdom_yazi
    update_dezly_kingdom_ghostty
    update_dezly_kingdom_hyprland
    echo "Your kingdom has been updated"
}

# Update only the Git configuration
function update_dezly_kingdom_git() {
    rm ~/.dezly-kingdom/configs/git/.gitconfig
    cp ~/.gitconfig ~/.dezly-kingdom/configs/git
}

# Update only the Zsh configuration
function update_dezly_kingdom_zsh() {
    rm ~/.dezly-kingdom/configs/zsh/.zshrc
    cp ~/.zshrc ~/.dezly-kingdom/configs/zsh
}

# Update only the Neovim configuration
function update_dezly_kingdom_neovim() {
    rm -rf ~/.dezly-kingdom/configs/neovim/nvim
    cp -r ~/.config/nvim ~/.dezly-kingdom/configs/neovim
}

# Update only the Yazi configuration
function update_dezly_kingdom_yazi() {
    rm -rf ~/.dezly-kingdom/configs/yazi/
    cp -r ~/.config/yazi/ ~/.dezly-kingdom/configs
}

# Update only the Ghostty configuration
function update_dezly_kingdom_ghostty() {
    rm -rf ~/.dezly-kingdom/configs/ghostty/
    cp -r ~/.config/ghostty/ ~/.dezly-kingdom/configs
}

# Update only the Yazi configuration
function update_dezly_kingdom_yazi() {
    rm -rf ~/.dezly-kingdom/configs/yazi/
    cp -r ~/.config/yazi/ ~/.dezly-kingdom/configs
}

# Update only the Hyprland configuration
function update_dezly_kingdom_hyprland() {
    rm -rf ~/.dezly-kingdom/configs/hyprland/hypr
    cp -r ~/.config/hypr ~/.dezly-kingdom/configs/hyprland
}

#______________________________________________________________________________

alias config-git="cd ~ && nvim .gitconfig"
alias config-zsh="cd ~ && nvim .zshrc"
alias config-neovim="cd ~/.config/nvim && nvim init.lua"
alias config-yazi="cd ~/.config/yazi/ && nvim yazi.toml"
alias config-hyprland="cd ~/.config/hypr/ && nvim hyprland.conf"

alias kingdom="cd ~/.dezly-kingdom"

alias tree="tree --gitignore"  
alias ls="lsd"
alias date-time='echo "⌚ $(date +"%A, %d %B %Y ( %I:%M:%S %p )")"'

alias battery-life="acpi"

alias bright-lowest="brightnessctl set 1%"
alias bright-10="brightnessctl set 10%"
alias bright-25="brightnessctl set 25%"
alias bright-half="brightnessctl set 50%"
alias bright-highest="brightnessctl set 100%"

# internet management
alias wifi-on="nmcli radio wifi on"
alias flight-mode="nmcli radio all off"

#______________________________________________________________________________
# SECTION: Zsh commands

alias reload-shell="exec zsh"

shell_history_clear() {
    cat /dev/null > ~/.zsh_history && \
    rm -f ~/.zsh_history && \
    touch ~/.zsh_history && \
    exec zsh
}

shell_history_disable() {
    unset HISTFILE
    export HISTSIZE=0
}

#______________________________________________________________________________
# SECTION: ZSH Autocompletion 

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#______________________________________________________________________________
# SECTION: Starship Shell Prompt

# Change the default zsh prompt to starship
eval "$(starship init zsh)"

#______________________________________________________________________________
# SECTION: Zsh Highlighting

# Make sure that this line is placed after the starship shell prompt
# line in this file, or else starship will cancel out the syntax highlighting 

# NOTE: Install this package first:
# sudo pacman -S --needed zsh-syntax-highlighting
source /usr/share/zsh/plugins/\
zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#______________________________________________________________________________
