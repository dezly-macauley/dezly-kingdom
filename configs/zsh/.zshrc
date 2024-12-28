# SECTIONL Enable History

HISTFILE=$HOME/.zsh_history
HISTSIZE=9000
SAVEHIST=9000

#______________________________________________________________________________
# SECTION: Update Dezly Kingdom Configurations

# Update the entire configuration
function update_dezly_kingdom() {
	update_dezly_kingdom_git
	update_dezly_kingdom_zsh
	update_dezly_kingdom_neovim
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

#______________________________________________________________________________

alias config-git="cd ~ && nvim .gitconfig"
alias config-zsh="cd ~ && nvim .zshrc"
alias config-neovim="cd ~/.config/nvim && nvim init.lua"

alias kingdom="cd ~/.dezly-kingdom"

alias tree="tree --gitignore"  
alias ls="lsd"

alias battery-life="acpi"

alias bright-lowest="brightnessctl set 1%"
alias bright-10="brightnessctl set 10%"
alias bright-25="brightnessctl set 25%"
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
