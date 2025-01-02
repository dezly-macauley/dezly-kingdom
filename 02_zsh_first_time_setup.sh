#!/bin/sh

# Load the default Zsh configuration from the config vault,
# to ensure that there is no misconfiguration after changing the shell to zsh

cp $HOME/.dezly-kingdom/config-vault/zsh/.zshrc $HOME

# This will check what the current shell is set to
current_shell="$SHELL"

# This will change the current shell to zsh if the shell is not
# already zsh
if [ "$current_shell" != "/usr/bin/zsh" ]; then
    sudo chsh -s /usr/bin/zsh "$USER"
    echo "Please restart your system."
else
    echo " "
    echo "The current shell is already Zsh. No changes made."
    echo " "
fi
