#______________________________________________________________________________
# SECTION: Mount Points

# The mount point of the external drive `sg-800`
local mount_point_sg_800="/run/media/dezly-macauley/sg-800"

#______________________________________________________________________________
# SUB_SECTION: External Drive

# Open the external drive
alias sg-800="cd $mount_point_sg_800"

# Safely Remove external drive
alias safely-remove-sg-800="sync \
&& udiskie-umount $mount_point_sg_800 \
&& sync"

#______________________________________________________________________________
# SECTION: Current Projects

alias project-one=""

#______________________________________________________________________________
# SECTION: Dezly Saga

saga() {
    local saga_root="$HOME/dezly-saga"
    
    local assembly_x86_64_recap="$saga_root/ethical-hacking/assembly/x86_64"
    local rust_recap="$saga_root/systems-programming/rust/rust-by-example"
    local sqlite_recap="$saga_root/database-management/sqlite/af-hp-sqlite"
    local vyper_recap="$saga_root/web3/vyper/01-cu-intro-to-py-and-vy/sec1-favorites"
    local zig_recap="$saga_root/systems-programming/zig/zig-guide/02-language"

    if [[ $# -eq 0 ]]; then
        cd $saga_root
    else
        case $1 in
            --assembly-x86-64) cd $assembly_x86_64_recap && nvim . ;;
            --rust) cd $rust_recap && nvim . ;;
            --sqlite) cd $sqlite_recap && nvim . ;;
            --vyper) cd $vyper_recap && nvim . ;;
            --zig) cd $zig_recap && nvim . ;;
            *) 
                echo "Error: $1 is not a valid flag"
                echo "
                Valid Commands:
               
                saga --assembly-x86-64
                saga --rust
                saga --sqlite
                saga --vyper
                saga --zig
                "
                ;;
        esac
    fi
}

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
# SECTION: Go Installed Programs 

# NOTE: Modifying the GOPATH

# By default Go sets this to `$HOME/.go`
# I don't like having a random directory in my home directory called `go`,
# so I modified the name and made it a hidden directory.
# This line below lets Go know that my file path has been changed.
# This is where I prefer Go to install packages
export GOPATH=$HOME/.go-global-pkgs

# NOTE: To check what the GOPATH is currently set to, run this command:
# go env GOPATH

# This adds the GOPATH to my shell so that I can use programs 
# installed by the Go package manager in any directory.
export PATH=$GOPATH/bin:$PATH

#______________________________________________________________________________
# SECTION: JavaScript Installed Programs 

# This where npm packages (JavaScript ecosystem) 
# that are installed and need to be available system-wide will go
export PATH="$HOME/.npm-global-pkgs/bin:$PATH"

#______________________________________________________________________________
# SECTION: Configuration Management

# Use these aliases to edit the files that are currently on your system

# Version Control and Shell
alias edit-git="cd $HOME && nvim .gitconfig"
alias edit-zsh="cd $HOME && nvim .zshrc"

# Graphical Applications
alias edit-ghostty="cd $HOME/.config/ghostty/ && nvim config"
alias edit-hyprland="cd $HOME/.config/hypr/ && nvim hyprland.conf"

# Terminal Applications
alias edit-neovim="cd $HOME/.config/nvim && nvim init.lua"
alias edit-yazi="cd $HOME/.config/yazi/ && nvim yazi.toml"

# Central Configuration
alias kingdom="cd $HOME/.dezly-kingdom"

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
    rm $HOME/.dezly-kingdom/config-archive/git/.gitconfig
    cp $HOME/.gitconfig $HOME/.dezly-kingdom/config-archive/git
    echo "🔄 config-archive/git has been updated"
}

function update_config_archive_zsh() {
    rm $HOME/.dezly-kingdom/config-archive/zsh/.zshrc
    cp $HOME/.zshrc $HOME/.dezly-kingdom/config-archive/zsh
    echo "🐚 config-archive/zsh has been updated"
}

function update_config_archive_ghostty() {
    rm -rf $HOME/.dezly-kingdom/config-archive/ghostty/
    cp -r $HOME/.config/ghostty/ $HOME/.dezly-kingdom/config-archive
    echo "👻 config-archive/ghostty has been updated"
}

function update_config_archive_hyprland() {
    rm -rf $HOME/.dezly-kingdom/config-archive/hypr
    cp -r $HOME/.config/hypr ~/.dezly-kingdom/config-archive
    echo "🖼️ config-archive/hyprland has been updated"
}

function update_config_archive_yazi() {
    rm -rf $HOME/.dezly-kingdom/config-archive/yazi/
    cp -r $HOME/.config/yazi/ $HOME/.dezly-kingdom/config-archive
    echo "🦆 config-archive/yazi has been updated"
}

function update_config_archive_neovim() {
    rm -rf $HOME/.dezly-kingdom/config-archive/nvim/
    cp -r $HOME/.config/nvim/ $HOME/.dezly-kingdom/config-archive
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

#______________________________________________________________________________
# SECTION: Screen Brightness

# WARNING: Do NOT set brightnessctl to 0%

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
    cat /dev/null > $HOME/.zsh_history && \
    rm -f $HOME/.zsh_history && \
    touch $HOME/.zsh_history && \
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
# SUB_SECTION: Zsh Highlighting

# NOTE: Install this package first:
# sudo pacman -S --needed zsh-syntax-highlighting
source /usr/share/zsh/plugins/\
zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#______________________________________________________________________________
# SUB_SECTION: Uv

# Enable shell auto completion for uv commands
# eval "$(uv generate-shell-completion zsh)"

# Enable shell auto completion for uvx commands
# eval "$(uvx --generate-shell-completion zsh)"

#______________________________________________________________________________
# SUB_SECTION: Direnv 

# NOTE: Install this package first:
# sudo pacman -S -needed direnv

# This is required for `direnv` to work
# direnv is a program that will automatically load the `.env` file in a
# directory when you enter that directory
eval "$(direnv hook zsh)"

# NOTE: This line below will disable the messages that direnv displays when 
# you enter a directory 

export DIRENV_LOG_FORMAT=""

#______________________________________________________________________________
# SUB_SECTION: Starship Shell Prompt

# WARNING: Make sure that starship is the last line in this `.zshrc` file

# Change the default zsh prompt to starship
# eval "$(starship init zsh)"
eval "$(starship init zsh)"

#______________________________________________________________________________
